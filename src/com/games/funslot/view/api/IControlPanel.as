package com.games.funslot.view.api 
{
	import com.games.funslot.api.IDestroyable;
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public interface IControlPanel extends IDestroyable
	{
		function setAssets(enabled:Bitmap, disabled:Bitmap):void;
		
		function enable():void;
		
		function disable():void;
	}
	
}