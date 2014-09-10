package com.games.funslot.view.decorators 
{
	import com.games.funslot.api.IDestroyable;
	import com.games.funslot.model.api.IStyleModel;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BitmapFilterType;
	import flash.filters.GradientGlowFilter;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class InfoPanelDecorator implements IDestroyable
	{
		private var _textFields	:Vector.<TextField>;
		private var _style		:IStyleModel;
		
		private var format:TextFormat;
		private var gradientGlow:GradientGlowFilter;
		
		public function InfoPanelDecorator(textFields:Vector.<TextField> ,style:IStyleModel) 
		{
			_textFields = textFields;
			_style		= style;
		}
		
		public function apply():void
		{
			if (!_textFields.length || !_style)
				return;
				
			format = new TextFormat();
			format.font = _style.textFont;
			format.size = _style.textSize;
			format.color = _style.textColor;
			format.align = TextFormatAlign.LEFT;
			format.bold = false;
			
			gradientGlow = new GradientGlowFilter();
			gradientGlow.distance = 0; 
			gradientGlow.angle = 45; 
			gradientGlow.colors = [_style.textColor, 0x000000];
			gradientGlow.alphas = [0, 0.5]; 
			gradientGlow.ratios = [0, 255]; 
			gradientGlow.blurX = 2; 
			gradientGlow.blurY = 2; 
			gradientGlow.strength = 3;
			gradientGlow.quality = BitmapFilterQuality.HIGH;
			gradientGlow.type = BitmapFilterType.OUTER;
			
			for each (var textField:TextField in _textFields)
			{
				textField.autoSize = TextFieldAutoSize.LEFT;
				textField.defaultTextFormat = format;
				textField.selectable = false;
				textField.multiline = false;
				textField.wordWrap = false;
				textField.filters = [gradientGlow];
			}
		}
		
		public function destroy():void
		{
			if (_textFields)
				_textFields.length = 0;
				
			_style = null;
			format = null;
			gradientGlow = null;
		}
		
	}

}