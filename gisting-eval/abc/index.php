<?php
session_start();
// Use $HTTP_SESSION_VARS with PHP 4.0.6 or less
if (!isset($_SESSION['user'])) {
	$_SESSION['user'] = rand();
}
$user = $_SESSION['user'];
session_write_close(); 
?>
<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.spml, .MT { margin-top: 1em;}
</style>
<script type="text/javascript">
function send_if_valid(form)
{
	var qs = form.getElementsByClassName('form');
	for (var i=0; i < qs.length; i++) {
		var inputs = qs[i].getElementsByTagName('input');
		var checked = 0;
		for (var j=0; j < inputs.length; j++) {
			if (inputs[j].checked) {
				checked = 1;
			}
		}
		if (checked == 0) {				
			alert("Du må svare på alle spørsmålene.");
			qs[i].focus();
			return false;
		}
	}
	form.submit();
}
</script>

<title>Apertium-evaluering</title>
</head>
<body>

<?php
$answered=0;
foreach ($_POST as $k => $v) {
	/* Ensure this directory is writable by httpd/apache: */
	file_put_contents("/srv/http/poormansdb/abc-results.csv", "$k,$v,$user\n", FILE_APPEND);
	$answered=1;
}
if ($answered==1) : ?>
<h1>Takk for svarene :)</h1>
<?php else: ?>

<h1>Svar på alle spørsmålene og klikk «Send inn svar»</h1>

<form name="theForm" method="post" action="<?php echo $_SERVER['SCRIPT_NAME']; ?>">

<?php require_once("spml.php"); ?>

<input class="par" type="button" value="Send inn svar" onclick="return send_if_valid(document.theForm);" />

</form>
<?php endif; ?>
</body>
