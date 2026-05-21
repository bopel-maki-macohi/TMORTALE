package tmor.backend.assets;

import haxe.io.Path;

class AssetPath
{
	public static function makePath(path:String, ?dir:String, ?ext:String):String
	{
		var fullpath:String = '';

		if (dir != null && dir.trim().length > 0)
			fullpath += '${Path.removeTrailingSlashes(dir)}/';

		fullpath += path;

		if (ext != null && ext.trim().length > 0)
			fullpath += '.$ext';

		return 'assets/$fullpath';
	}

	public static function getPresetClsPath(path:String, preset:AssetPathPreset):String
		return makePath(path, preset?.dir ?? null, preset?.ext ?? null);

	public static function getPresetPath(path:String, preset:String):String
		return getPresetClsPath(path, AssetPathPreset.presets.get(preset) ?? null);
}
