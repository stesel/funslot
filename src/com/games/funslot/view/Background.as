package com.games.funslot.view 
{
	import com.games.funslot.view.api.IBackground;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class Background extends Sprite implements IBackground
	{
		private var _image:Bitmap;
		
		public function setBackground(image:Bitmap):void
		{
			destroy();
			
			image.smoothing = true;
			_image = this.addChild(image) as Bitmap;
		}
		
		public function destroy():void
		{
			if (_image && this.contains(_image))
				this.removeChild(_image);
			_image = null;
		}
		
	}

}