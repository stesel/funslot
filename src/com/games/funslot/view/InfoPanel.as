package com.games.funslot.view 
{
	import com.games.funslot.view.api.IInfoPanel;
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class InfoPanel extends Sprite implements IInfoPanel
	{
		private var cashTextField	:TextField;
		private var winTextField	:TextField;
		private var betTextField	:TextField;
		
		//private var decorator:InfoPanelDecorator;
		
		public function InfoPanel() 
		{
			cashTextField = new TextField();
			winTextField = new TextField();
			betTextField = new TextField();
			
			this.addChild(cashTextField);
			this.addChild(winTextField);
			this.addChild(betTextField);
		}
		
		public function decorate(textColor:uint, textFont:String, textSize:int):void
		{
			
		}
		
		public function updateCash(value:String):void
		{
			cashTextField.text = value;
		}
		
		public function updateWin(value:String):void
		{
			winTextField.text = value;
		}
		
		public function updateBet(value:String):void
		{
			betTextField.text = value;
		}
		
		public function destroy():void
		{
			this.removeChild(cashTextField);
			this.removeChild(winTextField);
			this.removeChild(betTextField);
			
			cashTextField = null;
			winTextField = null;
			betTextField = null;
			
			//decorator = null;
		}
		
	}

}