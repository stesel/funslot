package com.games.funslot.model 
{
	import com.games.funslot.model.api.IGameModel;
	/**
	 * ...This Model contains player data
	 * @author Leonid Trofymchuk
	 */
	public class GameModel implements IGameModel
	{
		private var _balance:Number = 0;
		
		public function GameModel() 
		{
			
		}
		
		public function get balance():Number
		{
			return _balance;
		}
		
		public function set balance(value:Number):void
		{
			_balance = value;
		}
		
	}

}