#!/usr/bin/awk -f
NR%7==1 {q=(NR+6)/7;
	print "<h2>Spørsmål "q"</h2>";
	print "<div class='sme'><em>Originaltekst:</em>\n"$0"\n</div>"} 
NR%7==2 {print "<div class='MT'><em>Oversatt:</em>\n"$0"\n</div>"} 
NR%7==3 {
	print "<div class=\"form\">";
	print "<input type=\"radio\" name=\"q"q"\" id=\"q"q"\" value=\"a\" class=\"nice\"></input>" $0"<br/>";
}
NR%7==4 {
	print "<input type=\"radio\" name=\"q"q"\" id=\"q"q"\" value=\"b\" class=\"nice\"></input>" $0"<br/>";
}
NR%7==5 {
	print "<input type=\"radio\" name=\"q"q"\" id=\"q"q"\" value=\"c\" class=\"nice\"></input>" $0"<br/>";
	print "</div>";
}
NR%7==6 {
	print "<?php /* fasit: "$0"*/ ?>";
}
