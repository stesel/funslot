package com.games.funslot.vo 
{
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class LoadVO 
	{
		public var url	:String;
		public var id	:String;
		
		public function LoadVO(url:String = null, id:String = null)
		{
			this.url = url;
			this.id = id;
		}
		
	}

}