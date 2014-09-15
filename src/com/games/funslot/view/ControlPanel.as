package com.games.funslot.view 
{
	import com.games.funslot.events.factories.SpinEventFactory;
	import com.games.funslot.view.api.IControlPanel;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class ControlPanel extends Sprite implements IControlPanel
	{
		private var enabledAsset:Bitmap;
		private var disabledAsset:Bitmap;
		
		private const ASSET_X:int = 873;
		private const ASSET_Y:int = 267;
		
		private const ANIMATION_TIME:int = 80; //ms
		
		private var buttonContainer:Sprite;
		
		private var animationTimer:Timer;
		
		public function ControlPanel() 
		{
			buttonContainer = new Sprite();
			
			buttonContainer.x = ASSET_X;
			buttonContainer.y = ASSET_Y;
			
			buttonContainer.mouseChildren = true;
			buttonContainer.buttonMode = true;
			
			this.addChild(buttonContainer);
			
			animationTimer = new Timer(ANIMATION_TIME, 1);
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
			buttonContainer.addChild(enabledAsset);
			
			if ( buttonContainer.contains(disabledAsset) )
				buttonContainer.removeChild(disabledAsset);	
				
			buttonContainer.mouseEnabled = true;
			buttonContainer.addEventListener(MouseEvent.CLICK, clickEnabledAsset);
		}
		
		public function disable():void
		{
			buttonContainer.addChild(disabledAsset);
			
			if ( buttonContainer.contains(enabledAsset) )
				buttonContainer.removeChild(enabledAsset);
			buttonContainer.mouseEnabled = false;	
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