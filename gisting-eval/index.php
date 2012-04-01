<?php
foreach ($_POST as $k => $v) {
	/* Ensure the directory is writable by httpd/apache: */
	$out = shell_exec("echo \"$k,$v\" >> /poormansdb/results.csv");
}


require_once('gists.php')
?>
<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
div {float:left;}
.par {float:none;clear:both;}

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

</head>
<body>


<h1>Velg rett ord og klikk send</h1>

<form name="theForm" method="post" action="<?php echo $_SERVER['SCRIPT_NAME']; ?>">

<?php
$to_show=5;
$i=0;
$offset=rand(0,intval(count($q)/$to_show))*$to_show;
for($i=$offset; $i< $offset+$to_show && $i < count($q); $i++) {
	echo($q[$i][3]);
	echo("\n");
}
?>
<div class="par">&nbsp;</div>
<input class="par" type="button" value="Send inn svar" onclick="document.theForm.submit();" />
<br/><br/>
</form>

</body>
