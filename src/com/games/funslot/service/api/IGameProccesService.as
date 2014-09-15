package com.games.funslot.service.api 
{
	import com.games.funslot.api.IDestroyable;
	import com.games.funslot.vo.ImageAssetVO;
	/**
	 * ...
	 * @author Leonid Trofymchuk

	 */
	public interface IGameProccesService extends IDestroyable
	{
		function startSpin():void
		
		function get gameResult():Vector.<String>;
		
		function get winFactor():int;
		
		function addColoms(colomn1:Vector.<ImageAssetVO>, colomn2:Vector.<ImageAssetVO>, colomn3:Vector.<ImageAssetVO>):void
	}
	
}