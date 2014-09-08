package com.games.funslot.service.api 
{
	import com.games.funslot.vo.LoadVO;
	import com.games.funslot.events.LoadEvent;	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public interface ILoaderService 
	{
		function addXML(loadVO:LoadVO):void;
		
		function addImage(loadVO:LoadVO):void;
		
		function load(event:LoadEvent = null):void;
		
		function getXML(id:String):XML;
		
	}
	
}