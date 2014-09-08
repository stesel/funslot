package com.games.funslot.model 
{
	import com.games.funslot.events.factories.LoadEventFactory;
	import com.games.funslot.model.api.IConfigModel;
	import com.games.funslot.vo.LoadVO;
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class ConfigModel implements IConfigModel 
	{
		private const _configURL:String = "../assets/assets.xml";

		private var _assetsURLs:Vector.<LoadVO>;
		
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		public function ConfigModel() 
		{
			
		}
		
		public function get configURL():String
		{
			return _configURL;
		}
		
		public function get assetsURLs():Vector.<LoadVO>
		{
			return _assetsURLs;
		}
		
		public function parseConfigXML(xml:XML):void
		{
			_assetsURLs = new Vector.<LoadVO>();
			const assetsXMLList:XMLList = xml.children();
			for each (var asset:XML in assetsXMLList) 
			{
				const assetLoadVO:LoadVO = new LoadVO( asset.@url, asset.@name );
				_assetsURLs.push(assetLoadVO);	
			}
			
			eventDispatcher.dispatchEvent( LoadEventFactory.procedureLoadImages() );
		}
		
	}

}