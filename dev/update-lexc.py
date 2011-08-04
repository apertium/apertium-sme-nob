#!/usr/bin/python2.6
# encoding: utf-8


import os, sys, getopt
import subprocess as sp
import re

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

class LTExpError(Exception):
	def __init__(self, msg):
		print "lt-expand failed processing. Error:"
		print msg

class Conf_Validation_Error(Exception):
	def __init__(self, msg):
		print "The config file is invalid:"
		print msg


class Config(object):
	def default_options(self):
		self.LANG1 = "sme"
		self.LANG2 = "fin"
		self.GTHOME = os.environ.get("GTHOME")
		if not self.GTHOME: self.GTHOME = ""
		self.PRODUCE_LEXC_FOR = "sme"
		self.OUTPUT_DIR = os.getcwd() + '/../'
		self.GTPFX = 'gt'
		self.BIDIX_SIDE = 'R' # or L
		self.HEADER = "sme-lex.txt"
		self.LEXTYPE = 'hlexc'
		self.REMOVE_EMPTY_LEXICONS = 'no'
		self.SRC = self.GTHOME + '/' + self.GTPFX + '/' + self.PRODUCE_LEXC_FOR + '/src/'
		self.LEX_EXCLUDES = [
			"\!\^NG\^",
			"; \!SUB",
			"\! \!SOUTH",
			"\+Use\/NG",
			"\+Nom(.*)\+Use\/Sub",
			"\+Gen(.*)\+Use\/Sub",
			"\+Use\/Sub(.*)\+V\+TV",
			"\+Attr(.*)\+Use\/Sub",
			"LEXICON PRSPRCTOADJ \!SUB",
			"\+Imprt(.*)\+Use\/Sub",
			]
		self.files = [
			["verb-sme-lex.txt", 	'clip', 	{'pos_filter': 'V', 'split': 'VerbRoot\n'}],
			["noun-sme-lex.txt", 	'clip', 	{'pos_filter': 'N', 'split': 'NounRoot\n'}],
			["adj-sme-lex.txt", 		'clip', 	{'pos_filter': 'A', 'split': 'AdjectiveRoot\n'}],
			["propernoun-sme-morph.txt", 	'cat'],
			["propernoun-sme-lex.txt", 'clip', 	{'pos_filter': 'N><Prop', 'split': 'ProperNoun\n'}],
			["conjunction-sme-lex.txt", 	'cat'],
			["adv-sme-lex.txt", 		'clip', 	{'pos_filter': 'Adv', 'split': 'Adverb'}],
			["adv-sme-lex.txt", 		'clip', 	{'pos_filter': 'Adv', 'split': 'gadv ! adv that can form compounds', 'no_header': True, 'no_trim': True}],
			["subjunction-sme-lex.txt", 	'cat'],
			["pronoun-sme-lex.txt", 		'cat'],
			["particle-sme-lex.txt", 		'cat'],
			["pp-sme-lex.txt", 			'cat'],
			["numeral-sme-lex.txt", 		'cat'],
			["abbr-sme-lex.txt", 			'cat'],
			["punct-sme-lex.txt", 			'cat']
		]
		
	
	def __init__(self, defaults=False):
		"""
			Set default options. Don't change them here if you're editing the file. Change below.
		"""
		if defaults:
			self.default_options()
		else:
			self.LANG1 = ""
			self.LANG2 = ""
			self.GTHOME = os.environ.get("GTHOME")
			self.PRODUCE_LEXC_FOR = ""
			self.OUTPUT_DIR = '.'
			self.GTPFX = ''
			self.LEXTYPE = ''
			self.LEX_EXCLUDES = False
			self.REMOVE_EMPTY_LEXICONS = ''
		
			self.SRC = ''
		
			proc_lang = self.PRODUCE_LEXC_FOR
		
			self.HEADER = ""
		
			# List of lists, first item is filename, second item is action 'clip' or 'cat', third is dictionary of options.
			self.files = [
				["verb-sme-lex.txt", 	'clip', 	{'pos_filter': 'V', 'split': 'VerbRoot\n'}],
				["punct-sme-lex.txt", 			'cat']
			]
		
		return None
		
	def return_dict(self):
		D = {
			"LANG1": self.LANG1,
			"LANG2": self.LANG2,
			"GTHOME": self.GTHOME,
			"GTPFX": self.GTPFX,
			"OUTPUT_DIR": self.OUTPUT_DIR,
			"PRODUCE_LEXC_FOR": self.PRODUCE_LEXC_FOR,
			"files": self.files,
			"SRC": self.SRC,
			"LEXTYPE": self.LEXTYPE,
			"LEX_EXCLUDES": self.LEX_EXCLUDES,
			"REMOVE_EMPTY_LEXICONS": self.REMOVE_EMPTY_LEXICONS
		}
		return D
	
	def read_from_dict(self, D):
		# convert all arguments to str, json module is a little funny
		for k, v in D.items():
			# if type(k) == unicode:
			# 	a = str(k)
			# if type(v) == unicode:
			# 	b = str(v)
			self.__setattr__(str(k), str(v))
				
		self.files = D['files']
		if 'LEX_EXCLUDES' in D:
			self.excl_symbols = re.compile(r'|'.join(['(?:' + a + ')' for a in D['LEX_EXCLUDES']]))
		else:
			self.excl_symbols = False
		# if not self.SRC:
		# 	self.SRC = SRC = self.GTHOME + '/' + self.GTPFX + '/' + self.PRODUCE_LEXC_FOR + '/src/'

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
		print "Creating default config file: %s" % fname
		with open(fname, 'w') as F:
			DEFAULTS = Configs()
			DEFAULTS.langs = [Config(defaults=True)]
			json.dump([DEFAULTS.langs[0].return_dict()], F, ensure_ascii=True, sort_keys=True, indent=4)
			print "Done."
			print "Note, indentation of JSON does not matter so long as it is valid JSON."
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
				print e
				print "Oops, config file is farked up."
				return 2
			new_confs = Configs()
			if len(D) == 1:
				new = Config()
				new.read_from_dict(D[0])
				new_confs.langs = [new]
			elif len(D) > 1:
				new_confs.langs = []
				for item in D:
					new = Config()
					new.read_from_dict(item)
					new_confs.langs.append(new)	
			print "Loaded config from %s" % F.name
			
	DEFAULTS = False
	return new_confs

	
def Popen(cmd):
	proc = sp.Popen(cmd.split(' '), shell=False, stdout=PIPE, stderr=PIPE, stdin=PIPE)
	output, err = proc.communicate() # split('\n')
	return output, err

def lt_exp(fname):
	"""
		Validates for errors in dix, then returns expanded data.		
	"""
	
	output, err = Popen("apertium-validate-dictionary %s" % fname)
	if len(err) > 0:
		raise LTExpError(err)
	
	output, err = Popen("lt-expand %s" % fname)
	if len(err) > 0:
		raise LTExpError(err)
	
	# Remove REGEX and empty lines
	output = [l for l in output.splitlines() if "REGEX" not in l and l.strip()]
	
	return output


def cat_file(fname, ret_type=False, excl_symbols=False):
	"""
		Get data from file, if given excl_symbols, then exclude lines in LEX_EXCLUDES; otherwise return all data.
		
		Returns list.
	"""
	
	with open(fname, 'r') as F:
		if excl_symbols:
			data = [a for a in F if not excl_symbols.search(a)]
		else:
			data = F.readlines()
	
	if ret_type:
		if ret_type == list:
			return data
		elif ret_type == str:
			return ''.join(data)
	else:
		return data


def extract(data, fname, excl_symbols=False, pos_filter=False, split=False, no_header=False, split2=False, no_footer=False, no_trim=False, debug=False, side=None, remove_empty_lex=False):
	"""
		Given a pattern (e.g., V, N, N><Prop), extract matching intersecting words between lt-expanded data and lex file (fname).
		
		data (list) 		- lt-expanded data.
		fname (str) 		- File name to read.
		split (str) 		- Split after this point in a file, f. ex.: 'NounRoot\\n' splits at 'LEXICON NounRoot\n'
		pos_filter (str) 	- Filter lines based on pattern, e.g., V, N, N><Prop, etc. Will be turned to <V, <N, etc.
		no_header (bool) 	- False by default, if true, do not return header.
		no_trim (bool) 		- False by default, if true, do not filter based on pos_filter
		side (str)			- use this side of the bidix, 'left' or 'right'
		
	"""
	
	
	if fname.find('hlexc') > -1:	hlexc = True
	else:							hlexc = False
	
	if pos_filter:					search_key = pos_filter
	else:							search_key = False
		
	# lt_expand side -- move this to lt_expand func?
	
	# dieđusge<Adv>:tietenkään<Pcle>
	# Unjárga<N><Prop><Plc>:Uuniemi<N><Prop>
	
	# left = lambda x: x.partition(':')[0]
	# 	right = lambda x: x.partition(':')[2]
	
	left = lambda x: x.rsplit(':')[0]
	right = lambda x: x.rsplit(':')[-1]			# Need to split instead, to take care of asdf:<:bbq and asdf:>:bbq situations
	lemma = lambda x: x.partition('<')[0]
	
	if side == 'right':			side = right
	elif side == 'left':		side = left
	
	lx = lambda x: lemma(side(x))
				
	if search_key:
		# TODO: need a solution to this at some point. For now it's fine.
			# need to prioritize and do full matching with .endswith first, and then partial matching with .find.
		
			# These will not be matched with .endswith <V>, but will be matched with .find
			# asdf<V><IV>:asdf<V>
		
			# These will be matched with <N> and <N><Prop> with .find
			# bbq<N><Prop>:bbq<N><Prop>
		
			# want to make sure that <V> can still match <IV> and <TV>, yet <N> does not match <N><Prop>
			# without specifying multiple patterns in config?
		matcher = re.compile(search_key).search
		# print search_key
		# words = list(set([lx(a) for a in data if side(a).find(search_key) > -1]))
		words = list(set([lx(a) for a in data if matcher(a)]))
		# for a in data:
		# 	if matcher(a):
		# 		print matcher(a) #, len(matcher(a))
		# 		print lx(a)
		# words = list(set([lx(a) for a in data if side(a).endswith(search_key)]))
	else:
		words = list(set([lx(a) for a in data]))
	
	# Account for lt_expand's conversion of <j/> -> '+' by removing it
	# Why? Shouldn't it be changed into whatever the equivalent is in lexc?
	words = [word.replace('+', '') for word in words] 
	
	if debug:
		print str(len(words)) + ' unique words matching %s in .dix' % (str(search_key))
		# print str(len(words)) + ' unique words matching %s in .dix' % (str(search_key), fname.lower())
	
	with open(fname, 'r') as F:
		text = F.read()

	# split text
	if split:
		clip = text.split(split)
		head = clip[0] + split # '\n' + split + '\n'
		rest = clip[1]	       # If it fails here, check your "split" value!
	else:
		head = '\n'
		clip = text
		rest = text
	if split2:
		clip = rest.split(split2)
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

	not_in_morph = []
	if no_trim:
		trim = rest
	else:
		trim = []
		if hlexc:
			not_in_morph = words[:]
			for line in rest:
				if line.find(';') > -1:
					clipped = clip_line(line)
					if clipped in words:
						trim.append(line)
						
						try:					not_in_morph.pop(not_in_morph.index(clipped))
						except ValueError:		pass # There should be no other exceptions
						
						continue
				else:
					trim.append(line)
			
		else:
			for l in rest:
				# l = line.strip()
				if l.find(';') > -1:
					if clip_line(l) in words:
						trim.append(l)
						continue
				elif not l.strip() or commented(l): # line.startswith('!') or line.startswith(' !'):
					continue
				else:
					trim.append(l)
			not_in_morph = [a for a in words if clip_line(a) not in words]
	
	if debug:
		print "%d lines after trim" % (len(trim))
		
	# Print missing words to stderr
	if len(not_in_morph) > 0:
		sys.stderr.write('>>> %d words possibly missing in morphology: ' % len(not_in_morph))
		sys.stderr.write('\n>>> ' + ', '.join(not_in_morph))
		sys.stderr.write('\n')
	
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
	
	SRC = COBJ.SRC
	PROC_LANG = COBJ.PRODUCE_LEXC_FOR
	PREFIX = "%s-%s" % (COBJ.LANG1, COBJ.LANG2)
	
	BASENAME = "apertium-" + PREFIX
	
	DEV = os.getcwd() # Expecting we're in the dev directory... TODO: Fix
	OUTFILE = "%s.%s.lexc" % (BASENAME, PROC_LANG)
	
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
	
	print "... Reading words from bidix."
	lt_expand_data = lt_exp(fname="%s/../%s.%s.dix" % (DEV, BASENAME, PREFIX))
	
	if len(COBJ.HEADER) > 0:
		header_fname = COBJ.SRC + "/" + COBJ.HEADER
		print "... Reading header from %s" % header_fname
		main_header = cat_file(header_fname, list, COBJ.excl_symbols)  # TODO: header variable in conf
		output_ = [''.join(main_header)]
	else:
		print "... Assuming header is provided in 'files'."
		output_ = []
	
	output_app = output_.append
	
	for step in STEPS:
		fname, action = SRC + step[0], step[1]
		
		if len(step) == 3:
			opts = dict([(str(a), str(b)) for a, b in step[2].items()]) ; opts['side'] = BIDIX_SIDE ; opts['remove_empty_lex'] = REMOVE_EMPTY
		else:
			opts = None
		
		try:
			with open(fname, 'r') as F:
				exists = True			
		except IOError, e:
			print "*** File %s does not exist. Skipping. ***" % fname
			# TODO: do not continue?
			continue
		
		if action == 'clip':
			print "... Fetching words from %s" % fname
			if opts:
				head, trim = extract(lt_expand_data, fname, COBJ.excl_symbols, **opts)
			else:
				head, trim = extract(lt_expand_data, fname, COBJ.excl_symbols)
			data = head + trim
		elif action == 'cat':
			print "... Reading all of %s" % fname
			data = cat_file(fname, str) # ignores excl_symbols!
		
		output_app(data)
	
	# TODO: maybe this isn't a problem anymore
	# punct_point=`grep -nH ' real pilcrow' $PUNCTLEXC | cut -f2 -d':'`;
	# head -n $punct_point $PUNCTLEXC >> $OUTFILE;
	
	out_ = '\n'.join([a for a in output_])
	OUTFILE = COBJ.OUTPUT_DIR + OUTFILE
	
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
DEFAULT VALUES IN FILE:
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
			try:
				make_lexc(
					lang
				)
			except LTExpError:
				return 2
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
			
		# option processing
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
					return 2
				if option in ("-c", "--config"):
					fn = value
					XC = load_conf(fname=fn)
					run_with_conf(XC)
					return 2
		
	
	except Usage, err:
		print >> sys.stderr, sys.argv[0].split("/")[-1] + ": " + str(err.msg)
		return 2




if __name__ == "__main__":
	# make_lexc()
	profile = False
	# import profile
	if profile:
		profile.run("sys.exit(main())")
	else:
		sys.exit(main())



