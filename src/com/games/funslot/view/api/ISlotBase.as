package com.games.funslot.view.api 
{
	import com.games.funslot.api.IDestroyable;
	import flash.display.Bitmap;
	import com.games.funslot.vo.ImageAssetVO;
	/**
	 * ...
	 * @author Leonid Trofymchuk

	 */
	public interface ISlotBase extends IDestroyable
	{
		function addBetline(betLine:Bitmap):void
		
		function addColoms(colomn1:Vector.<ImageAssetVO>, colomn2:Vector.<ImageAssetVO>, colomn3:Vector.<ImageAssetVO>):void
	}
	
}