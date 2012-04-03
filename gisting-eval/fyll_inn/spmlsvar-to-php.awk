#!/usr/bin/awk -f
NR%5==1 {q=(NR+4)/5;
	print "<h2>Spørsmål "q"</h2>";
	print "<div class='sme'><em>Originaltekst:</em>\n"$0"\n</div>"} 
NR%5==2 {print "<div class='MT'><em>Oversatt:</em>\n"$0"\n</div>"} 
NR%5==3 {print "<div class='spml'>\n"$0"\n</div>"} 
NR%5==4 {
	print "<div class=\"form\"><input size=\"60\" type=\"text\" name=\"q"q"\" id=\"q"q"\" value=\"\" class=\"nice\"></input></div>";
	print "<?php /* fasit: "$0"*/ ?>";
}
