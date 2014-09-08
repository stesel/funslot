package com.games.funslot.vo 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class ImageAssetVO 
	{
		public var image:Bitmap;
		public var id	:String;
		
		public function ImageAssetVO(image:Bitmap = null, id:String = null) 
		{
			this.image = image;
			this.id = id;
		}
		
	}

}