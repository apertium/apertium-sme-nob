#!/usr/bin/python2.6
# encoding: utf-8


import os, sys, getopt
import subprocess as sp
import re
import liblt

try:
	import json
except ImportError:
	json = False
	print "json module not installed. Use python2.6 or install json. (easy_install json)"


#####
#
# Handy globals
#
#####

PIPE = sp.PIPE

class Conf_Validation_Error(Exception):
	def __init__(self, msg):
		print "The config file is invalid:"
		print msg


class Split_Error(Exception):
	def __init__(self, msg):
		print "Error: couldn't find the splitting point. Check the config value for:"
		print msg

class Config(object):
	def __init__(self):
		"""
			Initialise options. If you want to change the defaults, use langs.cfg.in.
		"""
		self.LANG1 = ""
		self.LANG2 = ""
		self.PRODUCE_LEXC_FOR = ""
		self.OUTPUT_DIR = '.'
		self.LEX_EXCLUDES = False
		self.REMOVE_EMPTY_LEXICONS = ''
		self.SRC = ''
		self.path = 'langs.cfg'
		self.excl_symbols = False

		proc_lang = self.PRODUCE_LEXC_FOR

		# List of lists, first item is filename, second item is dictionary of options.
		self.files = []
		
		return None
		
	def abs_dir(self, directory):
		"Return the absolute path to `directory', which may be specified relative to this config file"
		if os.path.isabs(directory):
			return directory
		else:
			if os.path.isabs(self.path):
				return os.path.dirname(self.path) + '/' + directory
			else:
				return os.path.dirname('./'+ self.path) + '/' + directory

	def abs_output_dir(self):
		return self.abs_dir(self.OUTPUT_DIR)

	def return_dict(self):
		D = {
			"LANG1": self.LANG1,
			"LANG2": self.LANG2,
			"OUTPUT_DIR": self.OUTPUT_DIR,
			"PRODUCE_LEXC_FOR": self.PRODUCE_LEXC_FOR,
			"files": self.files,
			"SRC": self.SRC,
			"LEX_EXCLUDES": self.LEX_EXCLUDES,
			"REMOVE_EMPTY_LEXICONS": self.REMOVE_EMPTY_LEXICONS
		}
		return D

	def read_from_dict(self, D, conf_path):
		"May return a new version of the object, so don't use without setting self to the return value."
		self.path = conf_path # Need to set this both before and after including
		if 'INCLUDE' in D:
			incfile = self.abs_dir(D['INCLUDE'])
			print >>sys.stderr, 'Including config %s ... ' % (incfile,),
			includes = load_conf(incfile)
			if len(includes.langs)>1:
				raise Conf_Validation_Error("Don't know how to include multiple-language configs!")
			elif len(includes.langs)<1:
				raise Conf_Validation_Error("Didn't find any configuration in %s" % (incfile,))
			self = includes.langs[0]
			self.path = conf_path
		# convert all arguments to str, json module is a little funny
		for k, v in D.items():
			self.__setattr__(str(k), str(v))

		if 'files' in D:
			self.files = D['files']
		elif not self.files:
			print >>sys.stderr, "WARNING: No 'files' defined in %s (nor in any sub-config of %s)." % (conf_path,conf_path)
		if 'LEX_EXCLUDES' in D:
			self.excl_symbols = re.compile(r'|'.join(['(?:' + a + ')' for a in D['LEX_EXCLUDES']]))

		return self
		
			


class Configs(object):
	def __init__(self):
		self.langs = [Config()]


#########
# 
#  Set these options here for default behavior, or use commandline to pass in arguments. See --help.
#
#########

def load_conf(fname, create=False):
	"""
		Load configs from JSON file
	"""
	
	if create:
		print "Creating default config file: %s using langs.cfg.in as a template" % fname
		with open(fname, 'w') as F:
			DEFAULTS = load_conf(os.path.dirname('./'+sys.argv[0]) + "/langs.cfg.in")
			json.dump([DEFAULTS.langs[0].return_dict()], F, ensure_ascii=True, sort_keys=True, indent=4)
			print "Done."
			print "NOTE: indentation of JSON does not matter so long as it is valid JSON."
		return True
	else:
		if not os.path.isfile(fname):
			print "Default file %s does not exist. Rerun with --create=langs.cfg to create a sample file, or specify the path of the config file with --config=FILENAME." % fname
			return False
	
	
	if not json:
		print "Either the json module is missing, or you are not using python2.6."
		return False
	
	if os.path.isfile(fname):
		with open(fname, 'r') as F:
			exists = True
			try:
				D = json.load(F)
			except Exception, e:
				print "Oops, config file is farked up."
				raise e
			new_confs = Configs()
			if len(D) == 1:
				new = Config()
				new = new.read_from_dict(D[0], F.name)
				new_confs.langs = [new]
			elif len(D) > 1:
				new_confs.langs = []
				for item in D:
					new = Config()
					new = new.read_from_dict(item, F.name)
					new_confs.langs.append(new)	
			print "Loaded config from %s" % F.name
	if not new_confs.langs[0].files:
		print "    no files in %s!!" % (fname,)
			
	DEFAULTS = False
	return new_confs

	

def any_analysis(fst, word, pos_filter, debug=False):
	"""Iterates through pos_filter, returning the first matching
	analysis. A partial match will be returned as an empty string,
	a non-match as u'@'."""
	analysis = u'@'
	if type(pos_filter) != type([]):
		pos_filter = [pos_filter]
	for p in pos_filter:
		a = fst.analyse(word.decode("utf-8") + p.decode("utf-8"))
		if a and a[0] != u'@':
			return a # return the first full match
		elif a == u"":
			analysis = a # partial match, but keep looking for a full match
	
	if debug and analysis == u"":
		print "%s had only a partial analysis" % (line)
	
	return analysis
			
		

def extract(fst, fname, excl_symbols=False, pos_filter="", split=False, no_header=False, split2=False, no_footer=False, no_trim=False, debug=False, side=None, remove_empty_lex=False, partial_matches=True):
	"""
		Given a POS tag string or list of such (e.g.
		['<V><TV>', '<V><IV>']), find the intersection of
		lemmas in lex file (fname) and lemmas with one of
		those taggings in bidix by looking up lemmas from lex
		file in the bidix FST.
		
		fst (liblt.FST)		- the bidix FST
		fname (str) 		- File name to read.
		split (str) 		- Only trim what's after this point in the file
		split2 (str) 		- Only trim what's before this point in the file
		pos_filter (str) 	- Appended to each line before fst lookup, e.g. '<V>' or '<Adv>'
					  Can be a simple string, or a list of strings.
		partial_matches (bool) 	- True by default, if false, pos_tags have to include a full bidix entry (e.g. '<N><Prop><Plc>')
		no_header (bool) 	- False by default, if true, do not prepend what's above split.
		no_footer (bool) 	- False by default, if true, do not append what's below split2.
		no_trim (bool) 		- False by default, if true, do not filter based on fst (and pos_filter)
		side (str)			- use this side of the bidix, 'left' or 'right'
		
	"""
	
	
	if fname.find('hlexc') > -1:	hlexc = True
	else:							hlexc = False
	
	# dieđusge<Adv>:tietenkään<Pcle>
	# Unjárga<N><Prop><Plc>:Uuniemi<N><Prop>
	
	left = lambda x: x.rsplit(':')[0]
	right = lambda x: x.rsplit(':')[-1]			# Need to split instead, to take care of asdf:<:bbq and asdf:>:bbq situations
	lemma = lambda x: x.partition('<')[0]
	
	if side == 'right':			side = right
	elif side == 'left':		side = left
	
	lx = lambda x: lemma(side(x))

	with open(fname, 'r') as F:
		text = F.read()

	# The file can have up to two split points, meaning we only
	# trim what's after split and before split2
	if split:
		clip = text.split(split)
		if len(clip) != 2:
			raise Split_Error("split of %s, currently set to:\n%s" %(fname,split))
		head = clip[0] + split # '\n' + split + '\n'
		rest = clip[1]
	else:
		head = '\n'
		clip = text
		rest = text
	if split2:
		clip = rest.split(split2)
		if len(clip) != 2:
			if text.split(split2):
				raise Split_Error("split2 of %s, currently set to:\n%s\nIt seems to appear before split?" %(fname,split2))
			else:
				raise Split_Error("split2 of %s, currently set to:\n%s" %(fname,split2))
		rest = clip[0]        # footer is "exclusive"
		foot = clip[1]
	else:
		# keep rest as-is
		foot = '\n'
	
	# Filter out text based on excludes
	rest = rest.splitlines()
	if excl_symbols:
		rest = [a for a in rest if not excl_symbols.search(a)]
	
	if debug:
		print "Sorting through %d lines" % len(rest)
	
	if hlexc:
		# priorisointi'][POS=NOUN][KTN=5][KAV=J]:priorisoin{t~~}{J}	kotus_5i_NOUN/stemfiller;
		clip_line = lambda x: x.split("'")[0]
	else:
		def clip_line(l):
			# remove some symbols
			chstr = lambda x: re.compile(r'(?<!%)[0\^\#%]').sub('', x)
			# 'foo0bar%0fie% foe%%fum' => 'foobar0fie foe%fum'

			# šikaneret+Use/Sub:sjikanere DOHPPE ; ! ^LOAN NOR
			colon_plus = re.compile(r'(?<!%)(:|\+)')
			split_cplus = lambda x: colon_plus.split(x.strip(), maxsplit=0)

			# bivval BIVVAL ;
			split_space = lambda x: re.compile(r'(?<!%)\s').split(x.strip(), maxsplit=0)

			# make sure we don't get confused by comments containing eg. colon_plus:
			l = re.compile(r'(?<!%)\!').split(l)[0]

			# Return clip if matches + or :, otherwise try matching with space.
			if colon_plus.findall(l): return chstr(split_cplus(l)[0])
			else: return chstr(split_space(l)[0])

	commented = re.compile('^\s*\!').match

	if no_trim:
		trim = rest
	else:
		trim = []
		for line in rest:
			if line.find(';') > -1:
				analysis = any_analysis(fst, clip_line(line), pos_filter, debug)
				if not analysis.startswith(u'@') and (partial_matches # partial match: analysis is empty string
								      or
								      analysis):
					trim.append(line)
			elif not hlexc and (not line.strip() or commented(line)):
				continue
			else:
				trim.append(line)
	
	if debug:
		print "%d lines after trim" % (len(trim))
	
	# trim.sort()
	trim = '\n'.join(trim)
	
	if hlexc and remove_empty_lex:
		# I have to do annoying things to remove empty lexicons
		strip_comments = re.sub(r'\!(.*)(\n)?', '', trim)
		fix_whitespace = re.sub(r'\n\n', '\n', strip_comments)
		
		lexica = re.sub(r'(\nLEXICON(.*)|\n)*(?P<lex>\nLEXICON(.*))\n(?!LEXICON)', '\g<lex>\n', fix_whitespace)
		lexica2 = re.sub(r'(\nLEXICON(.*)\n)\n*$', '', lexica)
		lexica3 = re.sub(r'(LEXICON(.*))(?P<lex>\nLEXICON(.*))', '\g<lex>\n', lexica2)
		
		trim = lexica3

	if split2:
		trim += "\n"
		if no_footer == False:
			trim = "%s\n%s\n%s\n" % (trim, split2, foot)

	if no_header:
		return '\n', "%s\n%s" % (split, trim)
	else:
		return head, trim


def make_lexc(COBJ=False):
	"""
		Rename this once it's done.
		
		This is the function that does everything.
		
		TODO: error handling if files don't exist
		TODO: switch everything to conf. object, so less things need to be passed in.
		
	"""
	THISDIR = os.path.dirname('./'+sys.argv[0]) + '/'
	SRC = COBJ.SRC
	PROC_LANG = COBJ.PRODUCE_LEXC_FOR
	PREFIX = "%s-%s" % (COBJ.LANG1, COBJ.LANG2)
	
	BASENAME = "apertium-" + PREFIX
	
	OUTFILE = "%s.%s.lexc" % (BASENAME, PROC_LANG)

	BIDIX_DIR = COBJ.abs_output_dir().rstrip('/')
	BIDIX_BIN = "%s/%s.autobil.bin" % (BIDIX_DIR, PREFIX)
	
	STEPS = COBJ.files
	
	if COBJ.REMOVE_EMPTY_LEXICONS:
		REMOVE_EMPTY = COBJ.REMOVE_EMPTY_LEXICONS
	else:
		REMOVE_EMPTY = False
	
	if COBJ.BIDIX_SIDE == 'R':
		BIDIX_SIDE = 'right'
	elif COBJ.BIDIX_SIDE == 'L':
		BIDIX_SIDE = 'left'
	else:
		error = 'BIDIX_SIDE must have a value of "L" or "R"'
		raise Conf_Validation_Error(error)
	
	if any([ ('no_trim' not in s[1] or not s[1]['no_trim'])
		 for s in STEPS ]):
		print "... Loading bidix FST %s" % (BIDIX_BIN,)
		if sp.call(["make", "-q", "sme-nob.autobil.bin"], cwd=BIDIX_DIR) == 1:
			print "\nWARNING: It seems like %s is not compiled! If this is correct, please compile the bidix (make sme-nob.autobil.bin), then re-run this script.\n" % (BIDIX_BIN,)
		# Finding the library file, should be in the same directory as this script
		# TODO: if we ever get around to sudo make installing this, ctypes.util.find_library() should do the trick
		LIBPATH = THISDIR + ".libs/libltpy.dylib"
		if os.uname()[0] == "Linux":
			LIBPATH = THISDIR + ".libs/libltpy.so"
		elif os.uname()[0] != "Darwin":
			print "Warning: Unknown platform, guessing Darwin"
		try:
			os.stat(LIBPATH)
		except Exception, e:
			print "\nCouldn't stat %s, did you forget to compile?\n" % (LIBPATH,)
			raise e
		fst = liblt.FST(LIBPATH, BIDIX_BIN)
	else:
		fst = None
		print "... Config has no 'clip' entries without no_trim, no need to use bidix."
	
	output_ = []
	
	output_app = output_.append
	
	for step in STEPS:
		fname = SRC + step[0]
		
		if len(step) == 2:
			opts = { 'side' : BIDIX_SIDE, 'remove_empty_lex': REMOVE_EMPTY }
			for a, b in step[1].items():
				if type(b) == type(u''):
					b = str(b)
				opts[str(a)] = b
		else:
			print "WARNING: No options defined for %s!" % fname
			opts = None
		
		try:
			with open(fname, 'r') as F:
				exists = True			
		except IOError, e:
			print "WARNING: File %s does not exist. Skipping." % fname
			# TODO: do not continue?
			continue
		
		print "... Fetching words from %s" % fname
		if opts:
			head, trim = extract(fst, fname, COBJ.excl_symbols, **opts)
		else:
			head, trim = extract(fst, fname, COBJ.excl_symbols)
		data = head + trim
		
		output_app(data)

	warning = """
!!!!! 
!!!!! This file was automatically generated using update-lexc.py.
!!!!! 
!!!!! It is not meant to contain every line from the upstream lexc files,
!!!!! only those root entries which are also in bidix.
!!!!! 
!!!!! DO NOT EDIT MANUALLY UNLESS YOU WANT YOUR CHANGES OVERWRITTEN.
!!!!! 

"""
	out_ = warning + '\n'.join([a for a in output_])
	OUTFILE = COBJ.abs_output_dir() + OUTFILE
	
	with open(OUTFILE, 'w') as F:
		F.write(out_)
		
	print '... Done.'
	print 'Saved to %s.\n' % OUTFILE
	return True
	


#########
#
# Begin command-line and input handling
#
##########

help_message = '''\n\nOPTIONS:
	--config=FILE 	Specify the path to another config file.
	--create=FILE	Create a default config file at FILE.
'''

# Describe structure of default conf fig.
help_message += """
"""

help_message += """
Currently which *-lex.txt files are processed is specified in a somewhat complicated way, however
if one file is missing, then the file skips and processing should continue anyway.

When trimming, all REGEX entries are ignored, so make sure you
don't expect to include REGEX entries from bidix in trimmed files!

If you don't want any LEX_EXCLUDES, simply don't include that option in your config file.
"""

class Usage(Exception):
	def __init__(self, msg):
		self.msg = msg

def run_with_conf(C):
	# TODO: if there's a failure here it's probably that the config file is screwed up
	# Need to validate some.
	# Wrapping here is for better ease at error handling.
	try:
		for lang in C.langs:
			make_lexc(
				lang
				)
	except AttributeError:
		if type(C) in [type(Config), type(Configs)]:
			print "Config file could not be read or was malformed."
			return 2
		
	return True

def main(argv=None):
	if argv is None:
		argv = sys.argv
	try:
		try:
			opts, args = getopt.getopt(argv[1:], "hcx:v", ["help", "config=", "create="])
		except getopt.error, msg:
			raise Usage(msg)
			
		# Option processing:
		if len(opts) == 0:
			print "\nNo options, using defaults in file, or langs.cfg."
			print "See --help for more information. \n"
			CONF = load_conf('langs.cfg')
			run_with_conf(CONF)
									
		elif len(opts) > 0:			
			for option, value in opts:
				if option == "-v":
					verbose = True
				if option in ("-h", "--help"):
					raise Usage(help_message)
				if option in ("-x", "--create"):
					load_conf(value, create=True)
					return 0
				if option in ("-c", "--config"):
					fn = value
					XC = load_conf(fname=fn)
					run_with_conf(XC)
					return 0
		
	
	except Usage, err:
		print >> sys.stderr, sys.argv[0].split("/")[-1] + ": " + str(err.msg)
		return 2




if __name__ == "__main__":
	sys.exit(main())

