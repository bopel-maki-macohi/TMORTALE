package tmor;

import flixel.FlxG;
import flixel.FlxState;
import tmor.menus.MainMenu;

class InitState extends FlxState
{
	override public function create()
	{
		super.create();

		FlxG.switchState(() -> getInitialState());
	}

	function getInitialState():FlxState
	{
		return new MainMenu();
	}
}
