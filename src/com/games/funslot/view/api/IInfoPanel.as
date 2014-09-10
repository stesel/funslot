package com.games.funslot.view.api 
{
	import com.games.funslot.api.IDestroyable;
	import com.games.funslot.model.api.IStyleModel;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public interface IInfoPanel extends IDestroyable
	{
		function decorate(styleModel:IStyleModel):void;
		
		function updateCash(value:String):void;
		
		function updateWin(value:String):void;
		
		function updateBet(value:String):void;
		
		function get x():Number;
		
		function get y():Number;
		
		function set x(value:Number):void;
		
		function set y(value:Number):void;
		
	}
	
}