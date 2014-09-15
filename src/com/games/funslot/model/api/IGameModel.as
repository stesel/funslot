package com.games.funslot.model.api 
{
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public interface IGameModel 
	{
		function get balance():Number;
		function set balance(value:Number):void;
		
		function get bet():Number;
		function set bet(value:Number):void;
		
		function get win():Number;
		function set win(value:Number):void;
	}
	
}