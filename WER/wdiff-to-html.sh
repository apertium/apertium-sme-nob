#!/bin/bash

if [ "$#" -ne 2 ]; then echo "Usage: sh wdiff-to-html.sh oldpaste newpaste"; echo "where arguments are from make-paste.sh"; exit 1; fi

DOLD=$(stat -f "%Sm" "$1")
DNEW=$(stat -f "%Sm" "$2")

WDIFFTMP=`mktemp -t wdiff.XXXXXXXXXX`;

wdiff "$1" "$2" |\
sed "s%^S %<div class='src'>%g" |\
sed "s%^R %<div class='ref'>%g" |\
sed "s%^M %<div class='MT'>%g" |\
grep -v '^[ 	]*$' |\
sed "s%^\([^<]\)%<div>\1%g" |\
sed "s%$%</div>%g" |\
sed "s%\(\[-[^-]*-\]\)%<span class='old'>\1</span>%g" |\
sed "s%\({+[^+]*+}\)%<span class='new'>\1$</span>%g" > $WDIFFTMP


cat <<EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>apertium-sme-nob, word-diff -- FROM: _ ${DOLD} _ TO: _ ${DNEW} _</title>
<style type="text/css">
.old {color: blue;}
.new {color: red;}
.src {color: purple;}
.ref {color: green;}
.MT {margin-bottom: 1em;}
</style>
</head>
<body>
$(cat $WDIFFTMP)
</body>
</html>
EOF

