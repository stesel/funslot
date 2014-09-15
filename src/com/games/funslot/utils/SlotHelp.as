package com.games.funslot.utils 
{
	import com.games.funslot.vo.ImageAssetVO;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Leonid Trofymchuk

	 */
	public class SlotHelp 
	{
		static public function sortRandom(colomn:Vector.<ImageAssetVO>):Vector.<ImageAssetVO> 
		{
			var oldList:Vector.<ImageAssetVO> = colomn;
			var newList:Vector.<ImageAssetVO> = new Vector.<ImageAssetVO>();
			var index:int;
			
			while (oldList.length)
			{
				index = int( Math.random() * oldList.length );
				newList.push( oldList.splice(index, 1)[0] );
			}
			
			return newList;
			
		}
		
		static public function copyColumn(colomn:Vector.<ImageAssetVO>):Vector.<ImageAssetVO> 
		{
			var orijList:Vector.<ImageAssetVO> = colomn;
			var newList:Vector.<ImageAssetVO> = new Vector.<ImageAssetVO>();
			
			var vo:ImageAssetVO;
			var image:Bitmap;
			
			for (var i:int = 0; i < orijList.length; i++)
			{
				vo = orijList[i];
				image = new Bitmap(vo.image.bitmapData);
				newList.push(new ImageAssetVO(image, vo.id));
			}
			
			return newList;
			
		}
	}

}