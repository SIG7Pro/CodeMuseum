import openfl.Assets;
// import ui.Performance;
import haxe.CallStack;
import openfl.events.UncaughtErrorEvent;
import openfl.Lib;
import flixel.FlxGame;
import flixel.FlxG;
import openfl.display.Sprite;
import flixel.FlxGame;
import flixel.FlxState;
import lime.system.System;
import sys.FileSystem;

class Main extends Sprite {
	// public static var performance:Performance;
	// Stuff taken from FNF', for experimental purposes only.
	var gameWidth:Int = 320; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var gameHeight:Int = 240; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var initialState:Class<FlxState> = museum.Entrance; // The FlxState the game starts with.
	var zoom:Float = 1; // If -1, zoom is automatically calculated to fit the window dimensions.
	var skipSplash:Bool = false; // Whether to skip the flixel splash screen that appears in release mode.
	var startFullscreen:Bool = false; // Whether to start the game in fullscreen on desktop targets

	public function main() {
		flixel.FlxG.stage.window.setIcon(lime.graphics.Image.fromFile("assets/images/b3313HUD/icons/icon-unset.png"));

		#if (hl && !debug)
		hl.UI.closeConsole();
		#end

		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onUncaughtError);

		var font = Assets.getFont("assets/fonts/EnhancedLatinJP_SM64.ttf");
		var bitmap = Assets.getBitmapData(Paths.image('b3313HUD/icons/icon-bf-old.png'));

		// performance = new Performance(font, bitmap, true, true);

		// super(museum.Entrance);
		// FlxG.stage.addChild(performance);
		addChild(new FlxGame(gameWidth, gameHeight, initialState, 1));
	}

	function onUncaughtError(e:UncaughtErrorEvent) {
		var error = e.error;

		var exceptionStack = CallStack.toString(CallStack.exceptionStack(true));
		error += '\n\n$exceptionStack';

		FlxG.stage.window.alert(error, 'Uncaught Error');
		Sys.exit(1);
	}
}
