package tmor.backend.controls;

class Controls
{
	public static var ui_up:Control = new Control('ui_up', [W, UP]);
	public static var ui_down:Control = new Control('ui_down', [S, DOWN]);

	public static var ui_left:Control = new Control('ui_left', [A, LEFT]);
	public static var ui_right:Control = new Control('ui_right', [D, RIGHT]);

	public static var accept:Control = new Control('accept', [ENTER]);
}
