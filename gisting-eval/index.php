<?php
require_once('gists.php');

session_start();
// Use $HTTP_SESSION_VARS with PHP 4.0.6 or less
if (!isset($_SESSION['user'])) {
	$_SESSION['user'] = rand();
}
$user = $_SESSION['user'];
session_write_close(); 

foreach ($_POST as $k => $v) {
	/* Add filename and answer here so it's easier to check the results: */
	$k_a = explode('_', $k);
	if(count($k_a)==2) {
		$l = $k_a[0];
		$q = $k_a[1];
		$gist = $paragraphs[$l];
		$filename=$gist[0];
		$answer=$gist[1][$q];
		/* Ensure this directory is writable by httpd/apache: */
		$out = shell_exec("echo \"$l,$q,$v,$answer,$filename,$user\" >> /poormansdb/results.csv");
	}

}

?>
<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
div {float:left; margin: 40px 3px;}
div.form {margin-top:-20px;}
.par {float:none;clear:both;}
.h {float:none;clear:both;font-style:italic;font-weight:bold;}
.sme { color:#353;margin:0;}
.MT { color:#335;margin:0;}

</style>

<style type = 'text/css'>
	/* style from http://explog.in/notes/formstyling.html */
input.nice { display: none }
label.nice { 
    background-color: #ddd; 
    text-shadow: 0 1px 0 #fff;
    background-image: -webkit-gradient(
	linear,
	left bottom,
	left top,
	color-stop(0.44, rgb(184,184,184)),
	color-stop(0.72, rgb(212,212,212))
    );
    background-image: -moz-linear-gradient(
	center bottom,
	rgb(184,184,184) 44%,
	rgb(212,212,212) 72%
    );
    color: #555;
    border-radius: 5px;
    padding: 3px;
    display: inline-block;
    cursor: pointer;
    border: solid #000 1px;
}
input.nice:checked + label.nice { 
    color: #002;
    background-color: #00f; 
    background-image: -webkit-gradient(
	linear,
	left bottom,
	left top,
	color-stop(0.44, rgb(134,235,129)),
	color-stop(0.72, rgb(165,240,153))
    );
    background-image: -moz-linear-gradient(
	center bottom,
	rgb(134,235,129) 44%,
	rgb(165,240,153) 72%
    );
    border: solid 1px #99f;
} 
input.nice:checked + label.radio {
    background-image: -webkit-gradient(
	linear,
	left bottom,
	left top,
	color-stop(0.44, rgb(54,146,227)),
	color-stop(0.72, rgb(100,192,242))
    );
    background-image: -moz-linear-gradient(
	center bottom,
	rgb(54,146,227) 44%,
	rgb(100,192,242) 72%
    );

    border: solid 1px #999;
}
</style>

<title>Apertium-evaluering</title>
</head>
<body>


<h2>Velg det du tror er rett ord og klikk «Send inn svar»</h2>

<form name="theForm" method="post" action="<?php echo $_SERVER['SCRIPT_NAME']; ?>">

<?php

echo $paragraphs[array_rand($paragraphs)][2];

?>
<div class="par">&nbsp;</div>
<input class="par" type="button" value="Send inn svar" onclick="document.theForm.submit();" />
<br/><br/>
</form>

</body>
