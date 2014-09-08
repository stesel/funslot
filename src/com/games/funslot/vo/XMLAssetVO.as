package com.games.funslot.vo 
{
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class XMLAssetVO 
	{
		public var xml	:XML;
		public var id	:String;
		
		public function XMLAssetVO(xml:XML = null, id:String = null) 
		{
			this.xml = xml;
			this.id = id;
		}
		
	}

}