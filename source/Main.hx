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

class Main extends FlxGame {
	// public static var performance:Performance;
	public function new() {
		var gameWidth:Int = 320; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
		var gameHeight:Int = 240; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
		var initialState:Class<FlxState> = museum.Entrance; // The FlxState the game starts with.

		flixel.FlxG.stage.window.setIcon(lime.graphics.Image.fromFile("assets/images/b3313HUD/icons/icon-unset.png"));

		#if (hl && !debug)
		hl.UI.closeConsole();
		#end

		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onUncaughtError);

		var font = Assets.getFont("assets/fonts/EnhancedLatinJP_SM64.ttf");
		var bitmap = Assets.getBitmapData(Paths.image('b3313HUD/icons/icon-bf-old.png'));

		// performance = new Performance(font, bitmap, true, true);

		/*<window width="1280" height="720" if="N64_SIZE_3  N64_WIDESCREEN"/>
			<window width="320" height="240" if="N64_SIZE"/>
			<window width="640" height="480" if="N64_SIZE_2"/>
			<window width="960" height="720" if="N64_SIZE_3"/>
			<window width="1280" height="960" if="N64_SIZE_4"/> */

		#if N64_SIZE
		gameWidth = 320;
		gameHeight = 240;
		#end
		#if N64_SIZE2
		gameWidth = 640;
		gameHeight = 480;
		#end
		#if N64_SIZE3
		gameWidth = 960;
		gameHeight = 720;
		#end
		#if N64_SIZE4
		gameWidth = 1280;
		gameHeight = 960;
		#end

		super(gameWidth, gameHeight, initialState);
		// FlxG.stage.addChild(performance);
	}

	function onUncaughtError(e:UncaughtErrorEvent) {
		var error = e.error;

		var exceptionStack = CallStack.toString(CallStack.exceptionStack(true));
		error += '\n\n$exceptionStack';

		FlxG.stage.window.alert(error, 'Uncaught Error');
		Sys.exit(1);
	}
}
