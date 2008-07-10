<?php
	
	$image = urldecode($_GET["image"]);
	
	if (stristr($image, ".png"))
	{
		$im = @imageCreateFromPNG ($image);
	}
	if (stristr($image, ".gif"))
	{
		$im = @imageCreateFromGIF ($image);
	}
	if (stristr($image, ".jpg") || stristr($image, ".jpeg"))
	{
		$im = @imageCreateFromjpeg ($image);
	}
	
	function resize_jpg($image,$w,$h)
		{
 			$thumb = @imagecreatetruecolor($w, $h);			
			imagecopyresampled ($thumb, $image, 0, 0, 0, 0, $w, $h, imagesx($image), imagesy($image));
 			return $thumb;		
		}
	
	function crop_jpg($image,$x,$y,$w,$h)
		{
 			$thumb = @imagecreatetruecolor($w, $h);			
			imagecopy($thumb, $image, 0, 0, $x, $y, $w, $h);
 			return $thumb;		
		}
	
	if (isset($_GET["img_width"]) && isset($_GET["img_height"]))
	{
		$img_width = $_GET["img_width"];
		$img_height = $_GET["img_height"];
		$im = resize_jpg($im,$img_width,$img_height);
	}
	if(isset($_GET["crop_x"]) && isset($_GET["crop_y"]) && isset($_GET["crop_width"]) && isset($_GET["crop_height"]))
	{
		$crop_x = $_GET["crop_x"];
		$crop_y = $_GET["crop_y"];
		$crop_width = $_GET["crop_width"];
		$crop_height = $_GET["crop_height"];
		$im = crop_jpg($im,$crop_x,$crop_y,$crop_width,$crop_height);
	}
	if(isset($_GET["quality"]))
	{
		$quality = $_GET["quality"];
	}
	else $quality = 75;
		
	header("Content-type: img/jpeg");
	@imageinterlace ( $im, 0);
	@imagejpeg($im,"",$quality);
	@imagedestroy($im);
	
?>