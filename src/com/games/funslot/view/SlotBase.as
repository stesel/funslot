package com.games.funslot.view 
{
	import com.games.funslot.events.factories.SpinEventFactory;
	import com.games.funslot.view.api.ISlotBase;
	import com.games.funslot.vo.ImageAssetVO;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class SlotBase extends Sprite implements ISlotBase
	{
			
		private var  _colomn1:Vector.<ImageAssetVO>;
		private var  _colomn2:Vector.<ImageAssetVO>;
		private var  _colomn3:Vector.<ImageAssetVO>;
		
		private var _betLine:Bitmap;
		
		private const betLineX:int = 40;
		private const betLineY:int = 259;
		private const underWinLine:int = 190;
		
		private const colomnStartY:int = 35;
		
		private const minVisibleX:int = 69;
		private const minVisibleY:int = 35;
		private const maxVisibleX:int = 720;
		private const maxVisibleY:int = 465;
		
		private var symbolContainer:Sprite;
		private var symbolContainerMask:Sprite;
		
		public function SlotBase() 
		{
			initSymbolContainer();
		}
		
		private function initSymbolContainer():void 
		{
			symbolContainer = new Sprite();
			symbolContainerMask = new Sprite();
			
			this.addChild(symbolContainer);
			this.addChild(symbolContainerMask);
			
			symbolContainer.mask = symbolContainerMask;
			
			symbolContainerMask.graphics.clear();
			symbolContainerMask.graphics.beginFill(0xff0000, 0.6);
			symbolContainerMask.graphics.drawRect(minVisibleX, minVisibleY, maxVisibleX, maxVisibleY);
		}
		
		public function addBetline(betLine:Bitmap):void
		{
			_betLine = betLine;
			_betLine.x = betLineX;
			_betLine.y = betLineY;
			this.addChild(_betLine);
		}
		
		public function addColoms(colomn1:Vector.<ImageAssetVO>, colomn2:Vector.<ImageAssetVO>, colomn3:Vector.<ImageAssetVO>):void
		{
			_colomn1 = colomn1;
			_colomn2 = colomn2;
			_colomn3 = colomn3;
			
			addColomn(_colomn1, symbolContainer);
			addColomn(_colomn2, symbolContainer);
			addColomn(_colomn3, symbolContainer);
		}
		
		private function addColomn(colomn:Vector.<ImageAssetVO>, container:Sprite):void 
		{
			var image:Bitmap;
			
			for (var i:int = 0; i < colomn.length; i++ )
			{
				image = colomn[i].image;
				container.addChild(image);
			}
			
		}
		
		public function destroy():void
		{
			while (symbolContainer.numChildren > 0)
				symbolContainer.removeChildAt(0);
				
			_colomn1.length = 0;
			_colomn2.length = 0;
			_colomn3.length = 0;
			
			this.removeChild(symbolContainer);
			this.removeChild(_betLine);
			this.removeChild(symbolContainerMask);
			
			symbolContainerMask = null;
			symbolContainer = null;
			_betLine = null;
		}
		
	}

}