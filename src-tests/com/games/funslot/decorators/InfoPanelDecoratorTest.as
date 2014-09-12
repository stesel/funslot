package com.games.funslot.decorators 
{
	import com.games.funslot.model.api.IStyleModel;
	import com.games.funslot.model.StyleModel;
	import com.games.funslot.view.decorators.InfoPanelDecorator;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import mockolate.ingredients.Mockolate;
	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.runner.MockolateRule;
	import mockolate.stub;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.async.Async;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class InfoPanelDecoratorTest 
	{
		private const textColor:uint = 0x0F0F0F;
		private const textFont:String = "Arial";
		private const textSize:Number = 18;
		
		[Rule]
		public var mocks:MockolateRule = new MockolateRule();
		
		[Mock(inject="false")]
		public var styleModel:IStyleModel;
		
		public var textField:TextField;
		public var textFormat:TextFormat;
		public var decorator:InfoPanelDecorator;
		
		[Before]
		public function runBeforeTest1(): void
		{
			styleModel = nice(IStyleModel);
			stub(styleModel).getter("textColor").returns(textColor);
			stub(styleModel).getter("textFont").returns(textFont);
			stub(styleModel).getter("textSize").returns(textSize);
		}
		
		[Test]
		public function testDecoratorApply():void
		{
			textField = new TextField();
			
			decorator = new InfoPanelDecorator(Vector.<TextField>([textField]), styleModel);
			decorator.apply();
			decorator.destroy();
			
			textField.text = "This is simple text";
			
			textFormat = textField.getTextFormat();
			
			assertEquals("Color values should be equal", textColor, textFormat.color);
			assertEquals("Font values should be equal", textFont, textFormat.font);
			assertEquals("Size values should be equal", textSize, textFormat.size);
			
		}
		
		[After]
		public function runAfterTest():void
		{
			styleModel = null;
			textField = null;
			textFormat = null;
			decorator = null;
		}
	}

}