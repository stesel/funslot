package com.games.funslot.service 
{
	import com.games.funslot.events.LoadEvent;
	import com.games.funslot.service.api.IAssetProvider;
	import com.games.funslot.vo.ImageAssetVO;
	import com.games.funslot.vo.LoadVO;
	import com.games.funslot.vo.XMLAssetVO;
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.Security;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class AssetProvider implements IAssetProvider
	{
		Security.allowDomain("*");
		
		private var urlLoader		:URLLoader;
		private var loader			:Loader;
		
		private var _xmlLoadQueue	:Vector.<LoadVO>;
		private var _imageLoadQueue	:Vector.<LoadVO>;
		
		private var _xmlAssets		:Dictionary;
		private var _imageAssets	:Dictionary;
		
		private var _currentEvent	:LoadEvent;
		
		private var _currentXMLID	:String;
		private var _currentImageID	:String;
		
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		public function AssetProvider() 
		{
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, urlLoaderCompleteHandler);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, loaderErrorHandler);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderCompleteHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loaderErrorHandler);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			
			_xmlLoadQueue = new Vector.<LoadVO>();
			_imageLoadQueue = new Vector.<LoadVO>();
			
			_xmlAssets = new Dictionary();
			_imageAssets = new Dictionary();
		}
		
		public function addXML(loadVO:LoadVO):void
		{
			_xmlLoadQueue.push(loadVO);
		}
		
		public function addImage(loadVO:LoadVO):void
		{
			_imageLoadQueue.push(loadVO);
		}
		
		public function load(event:LoadEvent = null):void
		{
			_currentEvent = event;
			
			_xmlAssets.length = 0;
			_imageAssets.length = 0;
			
			if (_xmlLoadQueue.length)
				loadXMLQueue();
				
			if (_imageLoadQueue.length)
				loadImageQueue();
		}
		
		public function getXML(id:String):XML
		{
			return _xmlAssets[id];
		}
		
		public function getImage(id:String):Bitmap
		{
			return _imageAssets[id];
		}
		
		private function loadXMLQueue():void 
		{
			if (_xmlLoadQueue.length)
			{
				loadXML(_xmlLoadQueue.shift());
			}
			else
				dispatchLoadComplete();
		}
		
		private function loadImageQueue():void 
		{
			if (_imageLoadQueue.length)
				loadImage(_imageLoadQueue.shift());
			else
				dispatchLoadComplete();
		}
		
		private function loadXML(xml:LoadVO):void 
		{
			_currentXMLID = xml.id;
			urlLoader.load( new URLRequest(xml.url) );
		}
		
		private function loadImage(image:LoadVO):void 
		{
			_currentImageID = image.id;
			loader.load( new URLRequest(image.url) );
		}
		
		private function dispatchLoadComplete():void 
		{
			eventDispatcher.dispatchEvent(_currentEvent);
		}
		
		private function urlLoaderCompleteHandler(e:Event):void 
		{
			try
			{
				_xmlAssets[_currentXMLID] = new XML(urlLoader.data);
			}
			catch (e:TypeError)
			{
				trace.apply(this, ["XML FILE ERROR: " + e.toString()]);
            }
			
			loadXMLQueue();
		}
		
		private function loaderCompleteHandler(e:Event):void 
		{
			try
			{
				_imageAssets[_currentImageID] = loader.content as Bitmap;
			}
			catch (e:TypeError)
			{
				trace.apply(this, ["IMAGE FILE ERROR: " + e.toString()]);
            }
			
			loadImageQueue();
		}
		
		private function loaderErrorHandler(e:IOErrorEvent):void 
		{

			trace.apply(this, ["AssetProvider:: IO ERROR: " + e.toString()]);
		}
		
		private function securityErrorHandler(e:SecurityErrorEvent):void 
		{
			trace.apply(this, ["AssetProvider:: SECURITY ERROR: " + e.toString()]);
		}
		
		public function destroy():void
		{
			urlLoader.removeEventListener(Event.COMPLETE, urlLoaderCompleteHandler);
			urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, loaderErrorHandler);
			urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			urlLoader = null;
            
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loaderCompleteHandler);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loaderErrorHandler);
			loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			loader = null;
			
			_xmlLoadQueue.length = 0;
			_imageLoadQueue.length = 0;
			
			_xmlAssets = null;
			_imageAssets = null;
			
			_currentEvent = null;
		}
		
	}

}