# -*- coding:utf-8 -*-
# Script that takes a tmx file and for each translation unit <tu>
# takes the source string and translates into the target language.
# The output is a table with the following structure
# source_language original STRING
# target_language original STRING
# target_language Apertium translated STRING
#
# Usage:
# (1) python check_mt-otpt.py
#     - the input dir is tmx_data
# (2) python check_mt-otpt.py -d DIRECTORY_NAME
#     - the input dir is DIRECTORY_NAME
# (3)  python check_mt-otpt.py -f FILE_NAME
#     - the input file is FILE_NAME
#
# the output dir is 'otpt_dir' in the current directory

import re, os, errno, cgi, json, xml
import sys, codecs, locale, getopt
import xml.etree.ElementTree as ET
from subprocess import Popen, PIPE
#from BeautifulSoup import BeautifulStoneSoup
from operator import itemgetter
from xml.dom.minidom import parse, parseString
from os.path import expanduser

def HTMLEntitiesToUnicode(text):
    """Converts HTML entities to unicode.  For example '&amp;' becomes '&'."""
    text = unicode(BeautifulStoneSoup(text, convertEntities=BeautifulStoneSoup.ALL_ENTITIES))
    return text

def unicodeToHTMLEntities(text):
    """Converts unicode to HTML entities.  For example '&' becomes '&amp;'."""
    text = cgi.escape(text).encode('ascii', 'xmlcharrefreplace')
    return text

def indent(elem, level=0):
	i = "\n" + level*"  "
	if len(elem):
		if not elem.text or not elem.text.strip():
			elem.text = i + "  "
		if not elem.tail or not elem.tail.strip():
			elem.tail = i
		for elem in elem:
			indent(elem, level+1)
		if not elem.tail or not elem.tail.strip():
			elem.tail = i
	else:
		if level and (not elem.tail or not elem.tail.strip()):
			elem.tail = i

def prettify(elem):
    """Return a pretty-printed XML string for the Element.
    """
    rough_string = ElementTree.tostring(elem, 'utf-8')
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="\t")

def getAMT(f,o_dir,src_only,wer):
    """Return a XML structure enriched with the Apertium MT output.
    """
    print('... processing ' + str(f))

    cwd = os.getcwd()
    out_dir_path = os.path.join(cwd,o_dir)
    if not os.path.exists(out_dir_path):
        os.mkdir(out_dir_path)

    
    o_root = ET.Element("html")
    o_head = ET.SubElement(o_root, "head")
    o_title = ET.SubElement(o_head, "title")
    o_title.text = str(f)
    o_meta_ct = ET.SubElement(o_head, "meta")
    o_meta_ct.set("http-equiv", "Content-Type")
    o_meta_ct.set("content", "text/html; charset=utf-8")
    o_style = ET.XML(table_style)
    o_head.insert(2,o_style)
    o_body = ET.SubElement(o_root, "body")
    o_body.set("bgcolor", "#ffffff")
    o_p1 = ET.SubElement(o_body, 'p')
    o_p1.text = "File: " + str(f)
    o_hline = ET.SubElement(o_body, 'hline')
    o_table = ET.SubElement(o_body, "table")
    o_table.set('class', 'tg')

    i_tree = ET.parse(f)
    i_root = i_tree.getroot()
    
    i_tu_list = i_root.findall('.//tu')
    for tu in i_tu_list:
        tr_sme = ET.SubElement(o_table, 'tr')
        th_sme = ET.SubElement(tr_sme, 'th')
        th_sme.set('class', 'tg-sme')
        th_sme.set('colspan', '2')
        th_sme.text = tu[0][0].text
        
        print('processing ' + str(tu[0][0].text) + '\n')

        p = Popen('echo '+'\''+tu[0][0].text+'\''+cmd, shell=True, stdout=PIPE, stderr=PIPE)
        out, err = p.communicate()
        
        if (not src_only):
            tr_nob = ET.SubElement(o_table, 'tr')
            th_nob = ET.SubElement(tr_nob, 'th')
            th_nob.set('class', 'tg-nob')
            th_nob.set('colspan', '2')
            th_nob.text = tu[1][0].text
        
        tr_amt = ET.SubElement(o_table, 'tr')
        th_amt = ET.SubElement(tr_amt, 'th')
        th_amt.set('class', 'tg-amt')
        th_amt.set('colspan', '2')
        th_amt.text = out.strip()
        if (not wer):
            th_amt.set('style', 'border-bottom: 2pt solid;')

        if (wer):
            tr_wer = ET.SubElement(o_table, 'tr')
            td_wer = ET.SubElement(tr_wer, 'td')
            td_wer.set('class', 'tg-wer')
            td_wer.set('style', 'border-bottom: 5pt solid;')
            td_wer.text = 'WER = value'
            td_ble = ET.SubElement(tr_wer, 'td')
            td_ble.set('class', 'tg-wer')
            td_ble.set('style', 'border-bottom: 5pt solid;')
            td_ble.text = 'BLEU = value'
            

        file_name=os.path.basename(str(f))[:-3]+'html'
        indent(o_root)
        o_tree = ET.ElementTree(o_root)
        o_tree.write(os.path.join(out_dir_path,str(file_name)),
                    xml_declaration=True,encoding='utf-8',
                    method="xml")
    print('DONE ' + str(f) + '\n\n')

table_style = '<style type="text/css">\n.tg  {border-collapse:collapse;border-spacing:0;}\n.tg td{font-family:Arial, sans-serif;font-size:14px;padding:8px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}\n.tg th{text-align:left;font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:8px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}\n.tg .tg-sme{background-color:#c0c0c0;vertical-align:top;font-weight:bold;}\n.tg .tg-nob{background-color:#efefef;vertical-align:top;font-style:normal;}\n.tg .tg-amt{vertical-align:top;font-style:normal;}\n.tg .tg-wer{vertical-align:top;font-style:normal;color:grey;font-style: italic;}\n.hr.vertical{width: 0px; height: 100%;}</style>'

# parameters to be adjusted as needed
s_lang = 'sme'
t_lang = 'nob'

try:
    os.environ["APERTIUM_TRUNK"]
except KeyError:
    print("Please set the environment variable APERTIUM_TRUNK.\n" +
    "This is the path to the directory where all apertium-SOURCE_LANG-TARGET_LANG reside.\n" +
    "To set the variable you open the $HOME/.profile file and add the following two line:\n" +
    "APERTIUM_TRUNK=/path/to/your/apertium/directory\n" +
	"export APERTIUM_TRUNK\n" +
	"The close the terminal and open it anew.")
    sys.exit(1)
apertium_home=os.environ["APERTIUM_TRUNK"]

atm_dir = apertium_home + '/apertium' + '-' + s_lang + '-' + t_lang
#print("APT home is " + atm_dir)
#cmd = '| apertium -d ' + atm_dir + ' ' + s_lang + '-' + t_lang
# Change previous line to the following line if you want to see the hashform tags
cmd = "| apertium -d " + atm_dir + " " + s_lang + '-' + t_lang + '-dgen'

def main():
    # parameters to be adjusted as needed
    total = len(sys.argv)
    i_file = ''
    i_dir = 'tmx_data'
    o_dir = 'otpt_dir'
    src_only = True
    wer = True

    if (src_only):
        wer = False

    if (total == 3):
        print('... total ' + str(total))
        if str(sys.argv[1]) == '-f':
        #print '... file ' + str(sys.argv[1])
        	i_file = str(sys.argv[2])
        	if i_file.endswith('tmx'):
        		getAMT(i_file,o_dir,src_only,wer)
        if str(sys.argv[1]) == '-d':
            i_dir = str(sys.argv[2])
            for root, dirs, files in os.walk(i_dir): # Walk directory tree
                print("Input dir {0} with {1} files ...".format(root, len(files)))
        
                for f in files:
                    if f.endswith('tmx'):
                    	getAMT(os.path.join(root,f),o_dir,src_only,wer)
    else:
        if (i_file == ''):
            for root, dirs, files in os.walk(i_dir): # Walk directory tree
                print("Input dir {0} with {1} files ...".format(root, len(files)))
        
                for f in files:
                    if f.endswith('tmx'):
                        getAMT(os.path.join(i_dir,f),o_dir,src_only,wer)
                
if __name__ == "__main__":
    reload(sys)
    sys.setdefaultencoding("utf-8")
    main()
