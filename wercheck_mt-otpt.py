#!/usr/bin/env python3
"""Translate source strings into target langauge.

Script that takes a tmx file and for each translation unit <tu>
takes the source string and translates into the target language.
The output is a table with the following structure

source_language original STRING
target_language original STRING
target_language Apertium translated STRING
"""
import argparse
import os
import sys
import xml.etree.ElementTree as ET
from subprocess import PIPE, Popen


def indent(elem, level=0):
    i = "\n" + level * "  "
    if len(elem):
        if not elem.text or not elem.text.strip():
            elem.text = i + "  "
        if not elem.tail or not elem.tail.strip():
            elem.tail = i
        for elem in elem:
            indent(elem, level + 1)
        if not elem.tail or not elem.tail.strip():
            elem.tail = i
    else:
        if level and (not elem.tail or not elem.tail.strip()):
            elem.tail = i


# testing a WER calculation function
# borrowed from
# https://github.com/zszyellow/WER-in-python
# to be tested against the Apertium WER calculation module
def getWER(r, h):
    """
    This is a function that calculate the word error rate in ASR.
    You can use it like this: getWER("what is it".split(), "what is".split())
    """
    import numpy

    # build the matrix
    d = numpy.zeros((len(r) + 1) * (len(h) + 1), dtype=numpy.uint8).reshape(
        (len(r) + 1, len(h) + 1)
    )
    for i in range(len(r) + 1):
        for j in range(len(h) + 1):
            if i == 0:
                d[0][j] = j
            elif j == 0:
                d[i][0] = i
    for i in range(1, len(r) + 1):
        for j in range(1, len(h) + 1):
            if r[i - 1] == h[j - 1]:
                d[i][j] = d[i - 1][j - 1]
            else:
                substitute = d[i - 1][j - 1] + 1
                insert = d[i][j - 1] + 1
                delete = d[i - 1][j] + 1
                d[i][j] = min(substitute, insert, delete)
    result = float(d[len(r)][len(h)]) / len(r) * 100
    result = str("%.2f" % result) + "%"
    return result


def getAMT(f, o_dir, mt_only, wer, htrans, mtrans, cmd):
    """Return a XML structure enriched with the Apertium MT output."""
    print("... PROCESSING " + str(f))

    cwd = os.getcwd()
    out_dir_path = os.path.join(cwd, o_dir)
    if not os.path.exists(out_dir_path):
        os.mkdir(out_dir_path)

    o_root = ET.Element("html")
    o_head = ET.SubElement(o_root, "head")
    o_title = ET.SubElement(o_head, "title")
    o_title.text = str(f)
    o_style = ET.XML(table_style)
    o_head.insert(2, o_style)
    o_body = ET.SubElement(o_root, "body")
    o_body.set("bgcolor", "#ffffff")
    o_p1 = ET.SubElement(o_body, "p")
    o_p1.text = "File: " + str(f)
    o_hline = ET.SubElement(o_body, "hline")
    o_table = ET.SubElement(o_body, "table")
    o_table.set("class", "tg")

    i_tree = ET.parse(f)
    i_root = i_tree.getroot()

    i_tu_list = i_root.findall(".//tu")
    for tu in i_tu_list:
        tr_source_lang = ET.SubElement(o_table, "tr")
        th_source_lang = ET.SubElement(tr_source_lang, "th")
        th_source_lang.set("class", "tg-sme")
        th_source_lang.set("colspan", "2")
        th_source_lang.text = tu[0][0].text

        print("PROCESSING " + str(tu[0][0].text) + "\n")

        p = Popen(
            "echo " + "'" + tu[0][0].text + "'" + cmd,
            shell=True,
            stdout=PIPE,
            stderr=PIPE,
            encoding="utf-8",
        )
        out, err = p.communicate()

        if not mt_only:
            tr_target_lang = ET.SubElement(o_table, "tr")
            th_target_lang = ET.SubElement(tr_target_lang, "th")
            th_target_lang.set("class", "tg-smj")
            th_target_lang.set("colspan", "2")
            th_target_lang.text = tu[1][0].text
            htrans = htrans + th_target_lang.text + " "

        tr_amt = ET.SubElement(o_table, "tr")
        th_amt = ET.SubElement(tr_amt, "th")
        th_amt.set("class", "tg-amt")
        th_amt.set("colspan", "2")
        th_amt.text = out.strip()
        mtrans = mtrans + th_amt.text + " "
        if not wer:
            th_amt.set("style", "border-bottom: 2pt solid;")

        if wer:
            wer_value = getWER(th_target_lang.text.split(), th_amt.text.split())
            tr_wer = ET.SubElement(o_table, "tr")
            td_wer = ET.SubElement(tr_wer, "td")
            td_wer.set("class", "tg-wer")
            td_wer.set("style", "border-bottom: 5pt solid;")
            # print '___ WER ' + str(wer_value)

            td_wer.text = "WER = " + str(wer_value)
            td_ble = ET.SubElement(tr_wer, "td")
            td_ble.set("class", "tg-wer")
            td_ble.set("style", "border-bottom: 5pt solid;")
            td_ble.text = "BLEU = value"

    if wer:
        o_p2 = ET.SubElement(o_body, "p")
        o_p2.text = "WER total = " + str(getWER(htrans.split(), mtrans.split()))
    file_name = os.path.basename(str(f))[:-3] + "html"
    indent(o_root)
    o_tree = ET.ElementTree(o_root)
    o_tree.write(
        os.path.join(out_dir_path, str(file_name)),
        xml_declaration=True,
        encoding="utf-8",
        method="xml",
    )
    print("DONE " + str(f) + "\n\n")


table_style = '<style type="text/css">\n.tg  {border-collapse:collapse;border-spacing:0;}\n.tg td{font-family:Arial, sans-serif;font-size:14px;padding:8px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}\n.tg th{text-align:left;font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:8px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}\n.tg .tg-sme{background-color:#c0c0c0;vertical-align:top;font-weight:bold;}\n.tg .tg-smj{background-color:#efefef;vertical-align:top;font-style:normal;}\n.tg .tg-amt{vertical-align:top;font-style:normal;}\n.tg .tg-wer{vertical-align:top;font-style:normal;color:grey;font-style: italic;}\n.hr.vertical{width: 0px; height: 100%;}</style>'


def set_apertium_command(s_lang, t_lang):
    try:
        os.environ["APERTIUM_HOME"]
    except KeyError:
        print(
            "Please set the environment variable APERTIUM_HOME.\n"
            + "This is the path to the directory where all apertium-SOURCE_LANG-TARGET_LANG reside.\n"
            + "To set the variable you open the $HOME/.profile file and add the following two line:\n"
            + "APERTIUM_HOME=/path/to/your/apertium/directory\n"
            + "export APERTIUM_HOME\n"
            + "The close the terminal and open it anew."
        )
        sys.exit(1)
    apertium_home = os.environ["APERTIUM_HOME"]

    atm_dir = apertium_home + "/apertium" + "-" + s_lang + "-" + t_lang
    # print("APT home is " + atm_dir)
    # cmd = '| apertium -d ' + atm_dir + ' ' + s_lang + '-' + t_lang
    # Change previous line to the following line if you want to see the hashform tags
    return "| apertium -d " + atm_dir + " " + s_lang + "-" + t_lang + "-dgen"


def arg_parser():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("--source_lang", "-s", help="Source language", default="sme")
    parser.add_argument("--target_lang", "-t", help="Target language", default="smj")
    group = parser.add_mutually_exclusive_group()
    group.add_argument(
        "-m",
        "--only_machine_translation",
        help="If set, only show machine translation",
        action="store_true",
    )
    group.add_argument(
        "--word_error_rate",
        "-w",
        help="If set, calculate word error rate",
        action="store_true",
    )
    parser.add_argument("-f", "--file", help="Process the given file")
    parser.add_argument(
        "-d",
        "--directory",
        help="Process the given directory",
        default="tmx_data",
    )

    return parser


def main():
    parser = args = arg_parser()
    args = parser.parse_args()

    cmd = set_apertium_command(args.source_lang, args.target_lang)

    # parameters to be adjusted as needed
    i_file = args.file
    i_dir = args.directory
    o_dir = "output_dir"
    mt_only = args.only_machine_translation
    wer = args.word_error_rate
    htrans = ""
    mtrans = ""

    if i_file is not None:
        if i_file.endswith("tmx"):
            getAMT(i_file, o_dir, mt_only, wer, htrans, mtrans, cmd)
        else:
            parser.print_help()
            raise SystemExit("Filename must end with .tmx")

    else:
        for root, _, files in os.walk(i_dir):  # Walk directory tree
            print("Input dir {0} with {1} files ...".format(root, len(files)))

            for f in files:
                if f.endswith("tmx"):
                    getAMT(
                        os.path.join(i_dir, f),
                        o_dir,
                        mt_only,
                        wer,
                        htrans,
                        mtrans,
                        cmd,
                    )

    print(f"Finished processing. Results are found in {o_dir}")


if __name__ == "__main__":
    main()
