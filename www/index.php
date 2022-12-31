<?php
$version='1.0';
$handle = fopen("$version/install.conf", 'r');
if ($handle)
{
	$temp='';
	$k=0;
	while (!feof($handle)) {
		$line = fgets($handle);
		if (strstr($line, 'type{') && strstr($line, 'name{') && $line[0]=='_') {
			$k++;
			
			for ($i=strrpos($line, 'categorie{')+10,$j=$i ;$line[$i] != '}';$i++)
			$categorie[$k]=substr($line,$j,$i+1-$j);
			if (! strstr($temp, '_'.$categorie[$k].'_')) {
				$temp.='_'.$categorie[$k].'_';
				$$categorie[$k]='';
			}
			
			for ($i=0; $line[$i]!='='; $i++)
			$var[$k]=substr($line,0,$i+1);
			
			for ($i=$i+2,$j=$i; $line[$i]!=$line[$j-1]; $i++)
			$value[$k]='';
			$value[$k]=substr($line,$j-1,$i+2-$j);
			
			for ($i=strrpos($line, 'type{')+5,$j=$i ;$line[$i] != '}';$i++)
			$type[$k]=substr($line,$j,$i+1-$j);
			
			for ($i=strrpos($line, 'name{')+5,$j=$i ;$line[$i] != '}';$i++)
			$name[$k]=substr($line,$j,$i+1-$j);
			if (strcmp($type[$k],'text')==0)
				$$categorie[$k].='<tr><th>'.$var[$k].'</th>'.'<td><input type="'.$type[$k].'" name="'.$var[$k].'" value="'.str_replace('"','',$value[$k]).'" /></td></tr>';
		}
	}
}
fclose($handle);
echo '
<div>
	<form action="index.php" method="post">';
$temp='';
$i=1;
while ($k > $i) {
	if (! strstr($temp, '_'.$categorie[$i].'_')) {
		$temp.='_'.$categorie[$i].'_';
		echo '
		<fieldset>
			<legend>'.$categorie[$i].'</legend>
			<table>'.$$categorie[$i].'</table>
		</fieldset>';
	}
	$i++;
}
echo '
		<fieldset>
			<input type="submit" value="Envoyer"/>
		</fieldset>
	</form>
</div>';
$i=$k;

while ($i > 0) {
	if (! isset($_POST[$var[$i]]))
		break;
	$i--;
}
if ($i==0) {
	$temp=$version.'-'.rand(0,9999999999999999);
	mkdir($temp);
	$handle = fopen("$temp/install.conf", 'x+');
	fwrite($handle, '__VERSION__=\''.$version."'\n");
	fwrite($handle, '__ISO_GENERATOR_CONF_ID__=\''.$temp."'\n");
	fwrite($handle, '__INS_INSTALL_HTTP_HOST__=\''.$_SERVER['HTTP_HOST']."'\n");
	while ($i != $k) {
		$i=$i+1;
		fwrite($handle, $var[$i].'='.$_POST[$var[$i]]."\n");
	}
	fclose($handle);
	exec("sudo -u root ./generator.sh $temp");
	echo '<META HTTP-EQUIV="Refresh" CONTENT="0; URL=http://'.$_SERVER['HTTP_HOST'].'/'.$temp.'/custom.iso">';
}
?>