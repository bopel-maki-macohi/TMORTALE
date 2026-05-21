package tmor.menus;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;

class TaleMenu extends FlxState
{
	var entries:Array<String> = ['Sinco', 'Portilizen', 'D-Sides Maki',];

	var spriteGrp:FlxSpriteGroup;

	var camFollow:FlxObject;

	var curSelection:Int = 0;

	override function create()
	{
		super.create();

		spriteGrp = new FlxSpriteGroup();
		add(spriteGrp);

		for (i => entry in entries)
		{
			var newSpr:FlxSprite = new FlxSprite(i * 256, 0, 'tales/${entry.toLowerCase()}/icon'.getPresetPath('image'));
			newSpr.ID = i;
			newSpr.screenCenter(Y);
			spriteGrp.add(newSpr);
		}

		camFollow = new FlxObject(0, FlxG.height / 2);
		add(camFollow);

		FlxG.camera.follow(camFollow, LOCKON, .4);

		changeSelection(0);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (Controls.ui_up.justPressed)
			changeSelection(-1);
		if (Controls.ui_down.justPressed)
			changeSelection(1);

		if (Controls.accept.justPressed)
			select();
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
			default:
				trace('No case for $selection');
		}
	}
}
