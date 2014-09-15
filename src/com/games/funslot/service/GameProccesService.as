package com.games.funslot.service 
{
	import com.games.funslot.enum.AssetID;
	import com.games.funslot.events.factories.SpinEventFactory;
	import com.games.funslot.service.api.IGameProccesService;
	import com.games.funslot.vo.ImageAssetVO;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	import robotlegs.bender.extensions.contextView.ContextView;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	
	public class GameProccesService implements IGameProccesService
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject]
		public var contextView:ContextView;
		
		private var spinTimer:Timer;
		
		private const TIMER_DELAY:int = 5000;
		
		private const AVAILIABLE_SPEED:Array = [31, 38.75, 77.5];
		private const ACCURACY:int = 30;
		
		private const BOLT_ALPHA		:Number = 1;
		private const TRANSPARENT_ALPHA	:Number = 0.4;
		
		private const LAST_VISIBLE_SYMBOL_Y:int = 345;
		private const COLOMN_START_Y:int = 35;
		private const COLOMN_END_Y:int = 810;
		
		private const underWinLine:int = 190;
		
		private const colomn1StartX:int = 69;
		private const colomn2StartX:int = 310;
		private const colomn3StartX:int = 553;
		
		private var _gameResult:Vector.<String>;
		
		private var _winFactor:int = 0;
		
		private var  _colomn1:Vector.<ImageAssetVO>;
		private var  _colomn2:Vector.<ImageAssetVO>;
		private var  _colomn3:Vector.<ImageAssetVO>;
		
		private var step1:Number;
		private var step2:Number;
		private var step3:Number;
		
		private var colomnSteps:Dictionary;
		private var colomnWinComplete:Dictionary;
		
		public function GameProccesService() 
		{
			spinTimer = new Timer(TIMER_DELAY, 1);
			spinTimer.addEventListener(TimerEvent.TIMER_COMPLETE, spinTimerComplete);
		}
		
		public function addColoms(colomn1:Vector.<ImageAssetVO>, colomn2:Vector.<ImageAssetVO>, colomn3:Vector.<ImageAssetVO>):void
		{
			_colomn1 = colomn1;
			_colomn2 = colomn2;
			_colomn3 = colomn3;
			
			colomnSteps = new Dictionary();
			
			colomnWinComplete = new Dictionary();
			colomnWinComplete[_colomn1] = false;
			colomnWinComplete[_colomn2] = false;
			colomnWinComplete[_colomn3] = false;
			
			alignColomns();
			
			setVisibility(false);
		}
		
		private function alignColomns():void
		{
			alignColomn(_colomn1, colomn1StartX);
			alignColomn(_colomn2, colomn2StartX);
			alignColomn(_colomn3, colomn3StartX);
		}
		
		private function alignColomn(colomn:Vector.<ImageAssetVO>, startX:int):void 
		{
			var image:Bitmap;
			for (var i:int = 0; i < colomn.length; i++ )
			{
				image = colomn[i].image;
				image.x = startX;
				image.y = COLOMN_START_Y + i * image.height;
			}
		}
		
		private function spinTimerComplete(e:TimerEvent):void 
		{
			spinTimer.stop();
			
			var resultColomn1:String = getRandomResult();
			var resultColomn2:String = getRandomResult();
			var resultColomn3:String = getRandomResult();
			
			_gameResult = new Vector.<String>();
			_gameResult.push( resultColomn1, resultColomn2, resultColomn3 );
			
			if (resultColomn1 == resultColomn2 && resultColomn2 == resultColomn3)
				_winFactor = 3;
			else if (resultColomn1 == resultColomn2 ||  resultColomn2 == resultColomn3 ||  resultColomn1 == resultColomn3)
				_winFactor = 2;
			else
				_winFactor = 0;
				
		}
		
		private function stopGameRound():void 
		{
			contextView.view.stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			setVisibility(false);
			eventDispatcher.dispatchEvent( SpinEventFactory.procedureStopSpinEvent() );	
		}
		
		private function getRandomResult():String 
		{
			var index:int = int(Math.random() * AssetID.ALL_SYMBOLS.length);
			return AssetID.ALL_SYMBOLS[index];
		}
		
		private function getRandomStep():Number 
		{
			var index:int = int(Math.random() * AVAILIABLE_SPEED.length);
			return AVAILIABLE_SPEED[index];
		}
		
		public function startSpin():void
		{
			alignColomns();
			
			colomnSteps[_colomn1] = getRandomStep();
			colomnSteps[_colomn2] = getRandomStep();
			colomnSteps[_colomn3] = getRandomStep();
			
			resetWinComplete();
			
			contextView.view.stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			spinTimer.start();
			
			setVisibility(true);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			if (spinTimer.running)
			{
				prossesSpin(_colomn1);
				prossesSpin(_colomn2);
				prossesSpin(_colomn3);
			}
			else
			{
				prossesEndSpin(_colomn1, _gameResult[0]);
				prossesEndSpin(_colomn2, _gameResult[1]);
				prossesEndSpin(_colomn3, _gameResult[2]);
				checkSpinEnd();
			}
			
		}
		
		private function prossesSpin(colomn:Vector.<ImageAssetVO>):void 
		{
			var step:Number = colomnSteps[colomn];
			
			var vo:ImageAssetVO;
			for (var i:int = colomn.length - 1; i > -1; i-- )
			{
				vo = colomn[i];
				vo.image.y += step;
				if (vo.image.y > COLOMN_END_Y)
				{
					vo.image.y = COLOMN_START_Y - vo.image.height + step;
				}
			}
		}
		
		private function prossesEndSpin(colomn:Vector.<ImageAssetVO>, result:String):void 
		{
			if ( colomnWinComplete[colomn] )
				return;
				
			var vo:ImageAssetVO;
			var delta:Number;
			
			for (var i:int = colomn.length - 1; i > -1; i-- )
			{
				vo = colomn[i];
				delta = underWinLine - vo.image.y;
				if ( (vo.id == result) && (delta >= 0 && delta < ACCURACY))
				{
					colomnWinComplete[colomn] = true;
					shiftElements(colomn, delta);
					return;
				}
			}
			
			prossesSpin(colomn);
		}
		
		private function shiftElements(colomn:Vector.<ImageAssetVO>, shift:Number):void
		{
			if (!shift)
				return;
				
			var vo:ImageAssetVO;
			for (var i:int = colomn.length - 1; i > -1; i-- )
			{
				vo = colomn[i];
				vo.image.y += shift;
			}
		}
		
		private function checkSpinEnd():void 
		{
			for (var key:* in colomnWinComplete)
			{
				if (!colomnWinComplete[key])
				 return;
			}
			
			stopGameRound();
		}
		
		private function resetWinComplete():void
		{
			for (var key:* in colomnWinComplete)
				colomnWinComplete[key] = false;
		}
		
		private function setVisibility(spin:Boolean):void 
		{
			setColomnVisibility(_colomn1, spin);
			setColomnVisibility(_colomn2, spin);
			setColomnVisibility(_colomn3, spin);
		}
		
		private function setColomnVisibility(colomn:Vector.<ImageAssetVO>, spin:Boolean):void
		{
			var vo:ImageAssetVO;
			
			for each (vo in colomn)
			{
				if (spin || (vo.image.y > underWinLine - ACCURACY && vo.image.y <= underWinLine) )
				{
					vo.image.visible = true;	
					vo.image.alpha = BOLT_ALPHA;
				}
				else if ( (vo.image.y < COLOMN_START_Y - vo.image.height - ACCURACY) || (vo.image.y > LAST_VISIBLE_SYMBOL_Y + ACCURACY) )
				{
					vo.image.visible = false;	
				}
				else
				{
					vo.image.visible = true;
					vo.image.alpha = TRANSPARENT_ALPHA;
				}
			}
		}
		
		public function get gameResult():Vector.<String>
		{
			return _gameResult;
		}
		
		public function get winFactor():int
		{
			return _winFactor;
		}
		
		public function destroy():void
		{
			spinTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, spinTimerComplete);
			spinTimer.reset();
			spinTimer = null;
			
			colomnSteps = null;
			colomnWinComplete = null;
			
			_colomn1 = null;
			_colomn2 = null;
			_colomn3 = null;
			
			_gameResult = null;
		}
	}

}