package com.games.funslot.view.api 
{
	import flash.display.Bitmap;
	import com.games.funslot.api.IDestroyable
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public interface IBackground extends IDestroyable
	{
		function setBackground(image:Bitmap):void
	}
	
}