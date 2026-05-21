package tmor.menus.tales;

class SincoTaleSelect extends TaleSelect
{
	override public function new()
	{
		super('sinco', ['dummy']);
	}

	override function performSelection(selection:String)
	{
		super.performSelection(selection);

		switch (selection.toLowerCase()) {}
	}
}
