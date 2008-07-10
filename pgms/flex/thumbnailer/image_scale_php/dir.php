<?php 
	$myDir = opendir("images");
	$myXML= "";
	while($file = readdir($myDir))
	  {
	  	if ( (stristr($file,"jpg"))||(stristr($file,"jpeg"))||(stristr($file,"swf")) )	
		 {
			$myXML.="<image src=\"".$file."\"/>\n";
		 }
	  }
	print $myXML;
?>