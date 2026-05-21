package tmor;

import flixel.FlxG;
import flixel.FlxState;
import tmor.backend.assets.AssetPathPreset;
import tmor.menus.MainMenu;

class InitState extends FlxState
{
	override public function create()
	{
		super.create();

		new AssetPathPreset('image', '', 'png');

		FlxG.switchState(() -> getInitialState());
	}

	function getInitialState():FlxState
	{
		return new MainMenu();
	}
}
