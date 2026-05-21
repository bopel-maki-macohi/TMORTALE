package tmor.backend.assets;

class AssetPathPreset
{
	public static var presets:Map<String, AssetPathPreset> = [];

	public var id(default, null):String;
	public var dir(default, null):String;
	public var ext(default, null):String;

	public function new(id:String, ?dir:String, ?ext:String)
	{
		this.id = id;
		this.dir = dir ?? null;
		this.ext = ext ?? null;

		presets.set(id, this);
	}
}
