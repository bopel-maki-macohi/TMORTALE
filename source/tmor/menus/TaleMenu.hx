package tmor.menus;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import tmor.menus.tales.SincoTaleSelect;

class TaleMenu extends FlxState
{
	var entries:Array<String> = [
		'Sinco',
		// 'Portilizen',
		// 'D-Sides Maki',
	];

	var spriteGrp:FlxSpriteGroup;

	var camFollow:FlxObject;

	var curSelection:Int = 0;

	var taleFile:String = 'icon';

	function getEntryPath(entry:String)
	{
		return 'tales/${entry.toLowerCase()}/icon'.getPresetPath('image');
	}

	override function create()
	{
		super.create();

		spriteGrp = new FlxSpriteGroup();
		add(spriteGrp);

		for (i => entry in entries)
		{
			var newSpr:FlxSprite = new FlxSprite(i * 256, 0, getEntryPath(entry));
			newSpr.ID = i;
			newSpr.screenCenter(Y);
			spriteGrp.add(newSpr);
		}

		camFollow = new FlxObject(FlxG.width / 2, FlxG.height / 2);
		add(camFollow);

		FlxG.camera.follow(camFollow, LOCKON, .4);

		changeSelection(0);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (Controls.ui_left.justPressed)
			changeSelection(-1);
		if (Controls.ui_right.justPressed)
			changeSelection(1);

		if (Controls.accept.justPressed)
			select();

		leaveControls();
	}

	function leaveControls()
	{
		#if !TALESMENU_STARTING
		if (Controls.leave.justPressed)
			FlxG.switchState(() -> new MainMenu());
		#end
	}

	function changeSelection(by:Int)
	{
		curSelection += by;

		if (curSelection < 0)
			curSelection = spriteGrp.members.length - 1;
		if (curSelection > spriteGrp.members.length - 1)
			curSelection = 0;

		for (sprite in spriteGrp)
		{
			sprite.color = FlxColor.WHITE;

			if (sprite.ID == curSelection)
			{
				camFollow.x = sprite.x;
				sprite.color = FlxColor.YELLOW;
			}
		}
	}

	function select()
	{
		var selection:String = entries[curSelection];

		switch (selection.toLowerCase())
		{
			case 'sinco':
				FlxG.switchState(() -> new SincoTaleSelect());

			default:
				trace('No case for $selection');
		}
	}
}
