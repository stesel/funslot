package com.games.funslot.model.api 
{
	import com.games.funslot.vo.LoadVO;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public interface IConfigModel 
	{
		function get configURL():String;
		function get assetsURLs():Vector.<LoadVO>;
		
		function parseConfigXML(xml:XML):void;
		
	}
	
}