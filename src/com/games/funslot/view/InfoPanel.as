package com.games.funslot.view 
{
	import com.games.funslot.model.api.IStyleModel;
	import com.games.funslot.view.api.IInfoPanel;
	import com.games.funslot.view.decorators.InfoPanelDecorator;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class InfoPanel extends Sprite implements IInfoPanel
	{
		private var cashTextField	:TextField;
		private var winTextField	:TextField;
		private var betTextField	:TextField;
		
		private var decorator:InfoPanelDecorator;
		
		private var position:Dictionary;
		
		private const cashTextFieldX	:int = 186;
		private const winTextFieldX		:int = 428;
		private const betTextFieldX		:int = 670;
		
		private const textFieldY		:int = 2;
		
		public function InfoPanel() 
		{
			cashTextField = new TextField();
			winTextField = new TextField();
			betTextField = new TextField();
			
			this.addChild(cashTextField);
			this.addChild(winTextField);
			this.addChild(betTextField);
			
			cashTextField.x = cashTextFieldX;
			winTextField.x = winTextFieldX;
			betTextField.x = betTextFieldX;
			cashTextField.y = winTextField.y = betTextField.y = textFieldY;
			
			position = new Dictionary();
			
			position[cashTextField] = cashTextField.x;
			position[winTextField] = winTextField.x;
			position[betTextField] = betTextField.x;
		}
		
		public function decorate(styleModel:IStyleModel):void
		{
			decorator = new InfoPanelDecorator( Vector.<TextField>([cashTextField, winTextField, betTextField]), styleModel );
			decorator.apply();
		}
		
		public function updateCash(value:String):void
		{
			updateTextField(cashTextField, value);
		}
		
		public function updateWin(value:String):void
		{
			updateTextField(winTextField, value);
		}
		
		public function updateBet(value:String):void
		{
			updateTextField(betTextField, value);
		}
		
		private function updateTextField(textField:TextField, value:String):void
		{
			textField.text = value;
			textField.x = position[textField] - (textField.width >> 1);
		}
		
		public function destroy():void
		{
			this.removeChild(cashTextField);
			this.removeChild(winTextField);
			this.removeChild(betTextField);
			
			cashTextField = null;
			winTextField = null;
			betTextField = null;
			
			position = null;
			
			decorator.destroy();
			decorator = null;
		}
		
	}

}