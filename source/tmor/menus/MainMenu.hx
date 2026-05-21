package tmor.menus;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MainMenu extends FlxState
{
	var entries:Array<String> = ['Tales',];

	var textGrp:FlxTypedGroup<FlxText>;

	var camFollow:FlxObject;

	var curSelection:Int = 0;

	override function create()
	{
		super.create();

		textGrp = new FlxTypedGroup<FlxText>();
		add(textGrp);

		for (i => entry in entries)
		{
			var newText:FlxText = new FlxText(0, i * 64, 0, entry, 16);
			newText.ID = i;
			newText.screenCenter(X);
			textGrp.add(newText);
		}

		camFollow = new FlxObject(0, 0, FlxG.width, FlxG.height);
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
			curSelection = textGrp.members.length - 1;
		if (curSelection > textGrp.members.length - 1)
			curSelection = 0;

		for (text in textGrp)
		{
			text.color = FlxColor.WHITE;

			if (text.ID == curSelection)
			{
				camFollow.y = -(FlxG.height * 0.75) + text.y;
				text.color = FlxColor.YELLOW;
			}
		}
	}

	function select()
	{
		var selection:String = entries[curSelection];

		switch (selection.toLowerCase())
		{
			case 'tales':
				FlxG.switchState(() -> new TaleMenu());

			default:
				trace('No case for $selection');
		}
	}
}
