#!/usr/bin/env python2
# -*- coding: utf-8; -*-

#$ tr ' ' '\n' < ../WER/eu.MT |grep '^[a-zæøåéêèóôò][a-zæøåéêèóôò]*$' > words

# then for each line that has an entry in words, add 7 random
# alternatives from words to it.

import sys,re, random


LEN_DIFF=1
MIN_LEN=6
N_ALT=4                         # these plus the right answer

all_words = set()
all_lines = []



def gistise(lines):
    for line_num,l in enumerate(lines):
        tokens = l.split(' ')
        answer = None
        can_substitute=[(i,t) for i,t in enumerate(tokens)
                        if t in all_words]
        if can_substitute:
            random.shuffle(can_substitute)
            i,answer=can_substitute[0]

            candidates = [c for c in all_words
                          if  len(c)>=len(answer)-LEN_DIFF
                          and len(c)<=len(answer)+LEN_DIFF]
            random.shuffle(candidates)
            alternatives = candidates[0:N_ALT] + [answer]
            random.shuffle(alternatives)

            html = "<div class=\"par\"><div>%s</div><div>\n%s\n</div><div>%s</div></div>" % (
                ' '.join(tokens[:i]),
                "<br/>\n".join(
                    ['\t<input type="radio" name="s%s" id="s%s_%s" value="%s" class="nice"></input><label for="s%s_%s" class="nice radio">%s</label>' % (
                            line_num, line_num, a_i, a, line_num, a_i, a)
                     for a_i,a in enumerate(alternatives)] ),
                ' '.join(tokens[i+1:]).rstrip()
                )
        else:
            html = "<div class=\"par\"><div>%s</div></div>" %(' '.join(tokens))
        print "$q[]=array('%s', 's%s', '%s', '%s');" % (sys.argv[1], line_num, answer, html.replace("'","&apos;"))



for f in sys.argv[1:]:
    lines = open(f).readlines()
    for l in lines:
        sublines = l.split('. ')
        for sl in sublines:
            all_lines.append(sl.replace('*',''))
            sl = re.sub('[.,()]', '', sl)
            w = [t for t in sl.split()
                 if re.match('^[a-zæøåéêèóôò]+$', t)
                 and len(t)>=MIN_LEN]
            all_words = all_words.union(w)

print '<?php $q=array();'
gistise(all_lines)
print '?>'
