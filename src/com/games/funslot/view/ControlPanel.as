package com.games.funslot.view 
{
	import com.games.funslot.events.factories.SpinEventFactory;
	import com.games.funslot.view.api.IControlPanel;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class ControlPanel extends Sprite implements IControlPanel
	{
		private var enabledAsset:Bitmap;
		private var disabledAsset:Bitmap;
		
		private const assetX:int = 873;
		private const assetY:int = 267;
		
		private var buttonContainer:Sprite;
		
		private const animationTime:int = 80; //ms
		
		private var animationTimer:Timer;
		
		public function ControlPanel() 
		{
			buttonContainer = new Sprite();
			
			buttonContainer.x = assetX;
			buttonContainer.y = assetY;
			
			this.addChild(buttonContainer);
			
			animationTimer = new Timer(animationTime, 1);
			animationTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onAnimationComplete);
		}
		
		public function setAssets(enabled:Bitmap, disabled:Bitmap):void
		{
			enabledAsset = enabled;
			disabledAsset = disabled;
			
			enabledAsset.x = - enabledAsset.width * .5;
			enabledAsset.y = - enabledAsset.height * .5;
			disabledAsset.x = - disabledAsset.width * .5;
			disabledAsset.y = - disabledAsset.height * .5;
			
			enabledAsset.smoothing = true;
			disabledAsset.smoothing = true;
		}
		
		private function clickEnabledAsset(e:MouseEvent):void 
		{
			buttonContainer.removeEventListener(MouseEvent.CLICK, clickEnabledAsset);
			buttonContainer.buttonMode = false;
			animationTimer.start();
			buttonContainer.scaleX = buttonContainer.scaleY = 0.95;
		}
		
		private function onAnimationComplete(e:TimerEvent = null):void 
		{
			buttonContainer.scaleX = buttonContainer.scaleY = 1;
			this.dispatchEvent( SpinEventFactory.procedureStartSpinEvent() );
		}
		
		public function enable():void
		{
			if ( enabledAsset )
				buttonContainer.addChild(enabledAsset);
			
			if ( disabledAsset && buttonContainer.contains(disabledAsset) )
				buttonContainer.removeChild(disabledAsset);	
				
			buttonContainer.buttonMode = true;
			buttonContainer.addEventListener(MouseEvent.CLICK, clickEnabledAsset);
		}
		
		public function disable():void
		{
			if ( disabledAsset )
				buttonContainer.addChild(disabledAsset);
			
			if ( enabledAsset && buttonContainer.contains(enabledAsset) )
				buttonContainer.removeChild(enabledAsset);
				
			buttonContainer.buttonMode = false;
			buttonContainer.removeEventListener(MouseEvent.CLICK, clickEnabledAsset);
		}
		
		public function destroy():void
		{
			if ( disabledAsset && buttonContainer.contains(disabledAsset) )
				buttonContainer.removeChild(disabledAsset);
				
			if ( enabledAsset && buttonContainer.contains(enabledAsset) )
				buttonContainer.removeChild(enabledAsset);
				
			this.removeChild(buttonContainer);
			buttonContainer = null;
			
			enabledAsset.removeEventListener(MouseEvent.CLICK, clickEnabledAsset);
			
			animationTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onAnimationComplete);
			animationTimer.reset();
			animationTimer = null;
			
			enabledAsset = null;
			disabledAsset = null;
		}
		
	}

}