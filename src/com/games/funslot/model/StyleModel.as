package com.games.funslot.model 
{
	import com.games.funslot.model.api.IStyleModel;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class StyleModel implements IStyleModel
	{
		private var _textColor:uint;
		private var _textFont:String;
		private var _textSize:int
		
		public function parse(xml:XML):void
		{
			_textColor	 = uint( xml["textColor"]) ;
			_textFont	 = String( xml["textFont"] );
			_textSize	 = int( xml["textSize"] );
		}
		
		public function get textColor():uint
		{
			return _textColor;
		}
		
		public function get textFont():String
		{
			return _textFont;
		}
		
		public function get textSize():int 
		{
			return _textSize;
		}
	}

}