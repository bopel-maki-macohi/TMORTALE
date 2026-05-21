package tmor.backend.controls;

import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

class Control
{
	public var id(default, null):String;
	public var keys(default, null):Array<FlxKey>;

	public function new(id:String, keys:Array<FlxKey>)
	{
		this.id = id;
		this.keys = keys;
	}

	public var justPressed(get, never):Bool;

	function get_justPressed():Bool
		return FlxG.keys.anyJustPressed(keys);

	public var justReleased(get, never):Bool;

	function get_justReleased():Bool
		return FlxG.keys.anyJustReleased(keys);

	public var pressed(get, never):Bool;

	function get_pressed():Bool
		return FlxG.keys.anyPressed(keys);
}
