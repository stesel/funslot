package com.games.funslot.events.factories 
{
	import com.games.funslot.events.LoadEvent;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class LoadEventFactory 
	{	
		static public function procedureLoadImages():LoadEvent
		{
			return new LoadEvent( LoadEvent.LOAD_IMAGES );
		}
		
		static public function procedureLoadStyle():LoadEvent 
		{
			return new LoadEvent( LoadEvent.LOAD_STYLE );
		}
		
		static public function procedureConfigLoaded():LoadEvent
		{
			return new LoadEvent( LoadEvent.CONFIG_LOADED );
		}
		
		static public function procedureImagesLoaded():LoadEvent
		{
			return new LoadEvent( LoadEvent.IMAGES_LOADED );
		}
		
		static public function procedureStyleLoaded():LoadEvent
		{
			return new LoadEvent( LoadEvent.STYLE_LOADED );
		}	
		
	}

}