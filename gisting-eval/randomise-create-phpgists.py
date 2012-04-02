#!/usr/bin/env python2
# -*- coding: utf-8; -*-

import sys, re, random

# Constants:
LEN_DIFF=1 # maximum difference in length between alternatives and correct answer
MIN_LEN=6  # minimum length of words to pick
N_ALT=4    # including the right answer we get N_ALT+1

TRICK_RATIO=0.05        # chance of a question having no correct answer

WINDOW_LEN=60           # number of words to show each time
WINDOW_OVERLAP=20       # maximum overlap between two paragraphs shown
Q_PER_WINDOW=5          # number of questions to create within each
                        # shown paragraph





def token_html(window_choices, q_i, t, line_num):
    if q_i in window_choices:
        return "\n%s\n" % "<br/>\n".join(
            ['\t<input type="radio" name="w%s_q%s" id="w%s_q%s_%s" value="%s" class="nice"></input><label for="w%s_q%s_%s" class="nice radio">%s</label>' % (
                    line_num, q_i,      # name
                    line_num, q_i, c_i, # id
                    c,                  # value
                    line_num, q_i, c_i, # for
                    c,                  # shown value
                    )
             for c_i,c in enumerate(window_choices[q_i])] )
    else:
        return t.replace("'","&apos;")

def gistise(all_windows, all_candidates):
    for win_num,(filename,tokens) in enumerate(all_windows):
        answers = []
        can_substitute=[ (i,t) for i,t in enumerate(tokens)
                         if t in all_candidates
                         # picking the first/last ones is mean:
                         and i>2 and i<len(tokens)-2 ]

        if len(can_substitute) < Q_PER_WINDOW:
            continue

        random.shuffle(can_substitute)
        window_choices = {}
        answers = can_substitute[0:Q_PER_WINDOW]

        for i,correct in answers:
            wrong = [c for c in all_candidates
                     if c != correct
                     and len(c)>=len(correct)-LEN_DIFF
                     and len(c)<=len(correct)+LEN_DIFF]
            random.shuffle(wrong)
            if random.random() < TRICK_RATIO:
                choice = wrong[0:N_ALT + 1]
            else:
                choice = wrong[0:N_ALT]+[correct]
                random.shuffle(choice)
            window_choices[i]=choice + ['(ingen passer)']

        html = '<div class="par">\n'
        last = 0
        for i in sorted(window_choices.keys()):
            if last < len(tokens):
                html += "<div>%s</div>\n" % ' '.join(tokens[last:i]).replace("'", "&apos;").replace('\\n','</div><div style="clear:both">')
            html += "<div class=\"form\">%s</div>\n" % token_html(window_choices, i, tokens[i], win_num)
            last = i+1
        if last < len(tokens):
            html += "<div>%s</div>\n" % ' '.join(tokens[last:]).replace("'", "&apos;").replace('\\n','</div><div style="clear:both">')
        html += "\n</div>"

        for i,a in answers:
            print "//w%s,q%s,%s,%s"%(win_num,i,a,filename)

        print "$paragraphs['w%s']=array('%s', %s, '%s');" % (
            win_num,
            filename,
            "array(%s)" % ','.join(["'q%s'=>'%s'" % (i,a) for i,a in answers]),
            html)



all_candidates = set()
all_windows = []
for f in sys.argv[1:]:
    slurp = open(f).read()

    candidates = [w for w in re.sub('[,()]|[.]$', '', slurp).split()
                  if re.match('^[a-zæøåéêèóôò]+$', w)
                  and len(w)>=MIN_LEN]
    all_candidates = all_candidates.union(candidates)

    words = slurp.replace('*','').replace('\n',' \\n ').split()
    all_windows.extend([ (f,words[i:i+WINDOW_LEN])
                         for i in range(0, len(words), WINDOW_LEN-WINDOW_OVERLAP) ])

print '<?php $paragraphs=array();'
gistise(all_windows, all_candidates)
print '?>'


# Results of trial run (SVN r37139):
# $ grep -c 'MT$' results.csv.parsed
# 44
# $ grep    'MT$' results.csv.parsed | grep -c '^correct'
# 36
# $ grep -c 'nob$' results.csv.parsed
# 24
# $ grep    'nob$' results.csv.parsed | grep -c '^correct'
# 23
# (ie. 36/44 for sme-nob, 23/24 for reference)

# TODO: candidates from the same PoS or not? Same PoS wouldn't catch
# grammar bugs, would it?

# TODO: Multiple Choice position bias, could simply show answers twice
# with different orders. Or find another system to compare with ...
