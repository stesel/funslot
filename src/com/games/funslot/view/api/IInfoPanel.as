package com.games.funslot.view.api 
{
	import com.games.funslot.api.IDestroyable;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public interface IInfoPanel extends IDestroyable
	{
		function decorate(textColor:uint, textFont:String, textSize:int):void;
		
		function updateCash(value:String):void;
		
		function updateWin(value:String):void;
		
		function updateBet(value:String):void;
	}
	
}