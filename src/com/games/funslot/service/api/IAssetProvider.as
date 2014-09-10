package com.games.funslot.service.api 
{
	import flash.display.Bitmap;
	import com.games.funslot.api.IDestroyable;
	import com.games.funslot.vo.LoadVO;
	import com.games.funslot.events.LoadEvent;	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public interface IAssetProvider extends IDestroyable
	{
		function addXML(loadVO:LoadVO):void;
		
		function addImage(loadVO:LoadVO):void;
		
		function load(event:LoadEvent = null):void;
		
		function getXML(id:String):XML;
		
		function getImage(id:String):Bitmap;
		
	}
	
}