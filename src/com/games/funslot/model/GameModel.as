package com.games.funslot.model 
{
	import com.games.funslot.model.api.IGameModel;
	/**
	 * ...This Model contains player data
	 * @author Leonid Trofymchuk
	 */
	public class GameModel implements IGameModel
	{
		private var _balance:Number = 1000;
		private var _bet:Number = 1;
		private var _win:Number = 0;
		
		public function get balance():Number
		{
			return _balance;
		}
		
		public function set balance(value:Number):void
		{
			_balance = value;
		}
		
		public function get bet():Number
		{
			return _bet;
		}
		
		public function set bet(value:Number):void
		{
			_bet = value;
		}
		
		public function get win():Number
		{
			return _win;
		}
		
		public function set win(value:Number):void
		{
			_win = value;
		}
		
	}

}