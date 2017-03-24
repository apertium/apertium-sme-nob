#!/usr/bin/env python3

import sys
from os.path import abspath, dirname
sys.path.append(abspath(dirname(__file__)+"/../testvoc"))
import streamparser

context = False
pre = ""
post = ""
for arg in sys.argv[1:]:
    if arg == "--colour":
        pre = "\033[0;35m"
        post = "\033[0m"
    elif arg == "--context":
        context = True


def fst(x):
    (a, _) = x
    return a


def snd(x):
    (_, b) = x
    return b


for blank, lu in streamparser.parse_file(sys.stdin, withText=True):
    if context:
        print(blank, end="")
    m = set((t, s.baseform)
            for r in lu.readings
            for s in r
            for t in s.tags
            if t.startswith("@"))
    if m:
        tag = pre+"".join(map(fst, m))+post
        if context:
            print(lu.wordform+tag, end="")
        else:
            lemma = "/".join(map(snd, m))
            print(lemma+tag, end="")
            print("")
    elif context:
        print(lu.wordform, end="")
