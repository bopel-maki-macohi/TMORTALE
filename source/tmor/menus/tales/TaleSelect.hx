package tmor.menus.tales;

import flixel.FlxG;

class TaleSelect extends TaleMenu
{
	var tale:String;

	override public function new(tale:String, entries:Array<String>)
	{
		super();

		this.tale = tale;
		this.entries = entries;
	}

	override function getEntryPath(entry:String)
	{
		return 'tales/$tale/${entry.toLowerCase()}/icon'.getPresetPath('image');
	}

	override function leaveControls()
	{
		if (Controls.leave.justPressed)
			FlxG.switchState(() -> new TaleMenu());
	}

	override function select()
	{
		var selection:String = entries[curSelection];

		performSelection(selection);
	}

	function performSelection(selection:String) {}
}
