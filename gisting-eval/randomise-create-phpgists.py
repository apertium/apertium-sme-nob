#!/usr/bin/env python2
# -*- coding: utf-8; -*-

import sys, re, random
import itertools, collections

# Constants:
LEN_DIFF=3 # maximum difference in length between alternatives and correct answer
MIN_LEN=4  # minimum length of words to pick
N_ALT=5    # including the right answer we get N_ALT+1

MAX_LINE_LEN=15  # no longer lines than this, in words
MIN_LINE_LEN=5  # no shorter lines than this, in words
MIN_QUESTIONS=2  # per line


TRICK_RATIO=0.00        # chance of a question having no correct answer

TAGS_USE=['<n><m><sg><def>$', '<n><m><sg><ind>$', '<n><m><pl><def>$', '<n><m><pl><ind>$']
TAGS_BAN=['<pr>', '<vblex>'] # even if a word has TAGS_USE, don't allow it if it has TAGS_BAN

all_candidates={}

analyses = open(sys.argv[1]).read().splitlines()
noblines = open(sys.argv[2]).read().splitlines()
smelines = open(sys.argv[3]).read().splitlines()
mtlines = open(sys.argv[4]).read().splitlines()


def context_html(context):
    return context.replace("'", "&apos;").replace('\\n','</div><div style="clear:both">')

def choice_html(choices, q_i, t, line_num):
    return "\t<div class=\"form\">\n\t%s\n\t</div>\n" % "<br/>\n\t".join(
        ['\t<input type="radio" name="l%s_q%s" id="l%s_q%s_%s" value="%s" class="nice"></input><label for="l%s_q%s_%s" class="nice radio">%s</label>' % (
                line_num, q_i,      # name
                line_num, q_i, c_i, # id
                c,                  # value
                line_num, q_i, c_i, # for
                c,                  # shown value
                )
         for c_i,c in enumerate(choices[q_i])] )


def form(analysis):
    new = ''
    last = None
    for c in analysis[1:]:
        if c == '/' and last != '\\':
            break
        new +=c
        last=c
    return new



def pick_random_weighted(tab):
    # Make a list where an elt with f=10 is shown ten times, etc.,
    # then pick a random element from that list
    c = collections.Counter(tab)
    position = random.randrange(sum(c.values()))
    return next(itertools.islice(c.elements(), position, None))

def pick_k_random_weighted(k, tab):
    # Pick k random elements from tab, weighted on their values.
    # Return empty list if we couldn't find that many elements.
    sample=[]
    while len(sample)<k and tab:
        picked = pick_random_weighted(tab)
        sample.append(picked)
        tab.pop(picked)
    if len(sample)==k:
        return sample
    else:
        return []



def all_true(list):
    """Seems there are old pythons that don't have `all'"""
    for elt in list:
        if not bool(elt):
            return False
    return True

# Fetch all analyses:
for tags in TAGS_USE:
    all_candidates[tags]={}
    for f in [form(w).lower() for w in analyses
              if w.find(tags) > -1
              and all_true([w.find(ban) == -1
                            for ban in TAGS_BAN])]:
        if f in all_candidates[tags]: all_candidates[tags][f]+=1
        else: all_candidates[tags][f]=1
    #print all_candidates[tags]

# Make gist questions:
print '<?php $paragraphs=array();'
for lnum,(lnob,lsme,lmt) in enumerate(zip(noblines,smelines,mtlines)):
    choices={}
    answers={}
    tokens = lnob.split()
    if len(tokens)<MIN_LINE_LEN or len(tokens)>MAX_LINE_LEN:
        continue
    for (i,w) in enumerate(tokens):
        wrong={}
        trick=bool(random.random() < TRICK_RATIO)
        if len(w)<MIN_LEN:
            continue
        tagged = [tags for tags in all_candidates.keys()
                  if w in all_candidates[tags].keys()]
        if not tagged:
            continue
        candidates = dict([(c,f)
                           for tags in tagged
                           for c,f in all_candidates[tags].iteritems()
                           if c!=w
                           and len(c)>=len(w)-LEN_DIFF
                           and len(c)<=len(w)+LEN_DIFF])
        if trick:
            wrong = pick_k_random_weighted(N_ALT + 1, candidates)
        else:
            wrong = pick_k_random_weighted(N_ALT, candidates)
        if not wrong:
            continue
        choice = wrong
        if not trick:
            choice.append(w)
        random.shuffle(choice)
        choices[i]=choice + ['(ingen som passer)']
        answers[i]=w

    if len(answers) < MIN_QUESTIONS:
        continue                # TODO: remove consecutive ones?

    html = ''
    html += '<div class="sme"><div class="h">Samisk:</div> %s</div>\n' % context_html(lsme)
    html += '<div class="MT"><div class="h">Maskinoversettelse:</div>%s</div>\n' % context_html(lmt)
    html += '<div class="nob"><div class="h">Opprinnelig oversettelse:</div>\n'
    last = 0
    for i in sorted(choices.keys()):
        if last < len(tokens):
            html += "\t<div>%s</div>\n" % context_html(' '.join(tokens[last:i]))
        html += choice_html(choices, i, tokens[i], lnum)
        last = i+1
    if last < len(tokens): 
       html += "\t<div>%s</div>\n" % context_html(' '.join(tokens[last:]))
    html += "\n</div>"

    print ""
    for i in sorted(answers.keys()):
        print "//l%s,q%s,%s,%s"%(lnum,i,answers[i],sys.argv[2])
    print "$paragraphs['l%s']=array('%s', %s, '%s');" % (
        lnum,
        sys.argv[2],
        "array(%s)" % ','.join(["'q%s'=>'%s'" % (i,answers[i])
                                for i in sorted(answers.keys())]),
        html)
print '?>'
