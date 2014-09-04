package com.games.funslot.model
{
	import com.games.funslot.model.api.IGameModel;
	import flash.events.EventDispatcher;
	import org.flexunit.asserts.assertEquals;
	/**
	 * ...
	 * @author Leonid Trofimchuk
	 */
	public class GameModelTest 
	{
		private var gameModel:IGameModel;
		
		[Before]
		public function runBeforeTest(): void
		{
			gameModel = new GameModel();
		}
		
		[Test]
		public function testGetSetBalance():void
		{
			const newBalance:Number = 31.8;
			
			gameModel.balance = newBalance;
			
			assertEquals(newBalance, gameModel.balance);
		}
		
		[After]
		public function runAfterTest():void
		{
			gameModel = null;
		}
	}

}