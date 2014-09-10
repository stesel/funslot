package com.games.funslot.model.api 
{
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public interface IStyleModel 
	{
		function parse(xml:XML):void;
		
		function get textColor():uint;
		
		function get textFont():String;
		
		function get textSize():int;
	}
	
}