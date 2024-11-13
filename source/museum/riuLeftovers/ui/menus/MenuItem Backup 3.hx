package ui.menus;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSubState;
// Menu Items
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
// (png + xml)
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import String;
import Math;

class MenuItem extends FlxSubState {
	var sprite:FlxSprite;

	public var daText:FlxText;
	// public var areaPosition:Int = 3;
	public var expectedX:Int = 308;
	public var expectedY:Int = 317;

	// https://haxe.org/manual/expression-for.html
	// Play, Options, Extras, Info, and Exit.
	var menuPlay:FlxSprite;
	var menuOptions:FlxSprite;
	var menuExtras:FlxSprite;
	var menuInfo:FlxSprite;
	var menuExit:FlxSprite;
	var createdEntries:Int = 0;
	var menuPrefix:String = "UI/Main Menu/menu";
	var selectAbles:Array<String> = ["Play", "Options", "Extras", "Info", "Exit"];

	// Shoutouts to https://github.com/Ralsin/FNF-MintEngine/blob/1c681b35e081c1b297f47ed06815503f6ed7089a/source/funkin/menus/MainMenu.hx#L13 which helped me realize :Array<Spring> was.

	override function create() {
		var b2aseBG = new FlxSprite();
		b2aseBG.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		b2aseBG.alpha = 0.75;
		add(b2aseBG); // baseBG stays still!

		trace("Substate MenuItem.hx is active!");

		/*

			healthHeads = new FlxSprite();
			var headTex = FlxAtlasFrames.fromSparrow(AssetPaths.healthHeads__png, AssetPaths.healthHeads__xml);
			healthHeads.frames = headTex;
			healthHeads.animation.add('healthy', [0]);
			healthHeads.animation.add('unhealthy', [1]);
			healthHeads.y = healthBar.y - (healthHeads.height / 2);
			healthHeads.scrollFactor.set();
			add(healthHeads);

			Referene code from an old version of Friday Night Funkin' since I forgot how to import atlas frames/.
			https://github.com/FunkinCrew/Funkin/blob/567a7af392085da91ba8382e8117b2bcd9d03e7f/source/PlayState.hx

			 Position and Opacity Info

			top - 158, 27, 50%
			halftop - 248, 167, 75%
			selected - center - 308, 317, 100%
			halfbottom - 248, 467, 75%
			bottom - 148, 617, 50% (tho may switch to 158 X)
		 */

		for (createdEntries in selectAbles) {
			trace(createdEntries + " Entries");
			var menuItem:Int = 1;
			var menuTitle:String = createdEntries;
			var menulowercase:String = menuTitle.toLowerCase();
			// https://github.com/FunkinCrew/Funkin/blob/b644b6f8fe21699a486b3a6ce9fad7e4abfdc1b9/source/StoryMenuState.hx#L326
			// Lowecase savior!
			// Or so I thought since source/ui/menus/MenuItem.hx:81: characters 43-54 : Array<String> has no field toLowerCase
			// How I felt when I found out I was accidentally putting selectAbles instead of createdEntries
			sprite = new FlxSprite();
			var animationData = FlxAtlasFrames.fromSparrow(Paths.image(menuPrefix + createdEntries + ".png"),
				Paths.image(menuPrefix + createdEntries + ".xml"));
			sprite.frames = animationData;
			sprite.animation.add(menulowercase + 'Selected', [0]);
			sprite.animation.add(menulowercase + 'Unselected', [1]);
			// sprite.y = healthBar.y - (sprite.height / 2);
			sprite.x = 308;
			sprite.y = 317;
			sprite.ID = menuItem;
			// FlxG.watch.add(_sprite, "x");
			// FlxG.watch.add(_sprite, "y");
			trace(sprite.ID + " ID");

			add(sprite);

			createdEntries += 1;
		}

		var button = new FlxButton(0, 0, "Click me", onButtonClicked);
		button.screenCenter();
		add(button);

		daText = new FlxText();
		daText.text = "Hello, World!";
		daText.color = FlxColor.CYAN;
		daText.size = 32;
		daText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLUE, 4);
		daText.screenCenter();
		add(daText);
	}

	function onButtonClicked() {
		FlxG.camera.flash(FlxColor.WHITE, 0.33);
		// sprite.y = Math.cos(sprite.y/1.1)*90;
		// sprite.x = Math.cos(sprite.x/1.1)*90;
	}

	function travelTo() {}

	override function update(elapsed:Float) {
		super.update(elapsed);

		daText.text = "X:" + sprite.x + "\nY:" + sprite.y /*+ "\nP:" + areaPosition*/;

		// https://haxe.org/manual/expression-switch.html
	}
	/*Notes to self:

		// source 1
		  // https://github.com/Ralsin/FNF-MintEngine/blob/1c681b35e081c1b297f47ed06815503f6ed7089a/source/funkin/menus/MainMenu.hx#L44
		// source 2
		  // f(y) = cos(y/1.1)*90
		  // https://discord.com/channels/162395145352904705/165234904815239168/1287239928052453449




		  https://snippets.haxeflixel.com/tweens/tween/
		  https://github.com/Ralsin/FNF-MintEngine/blob/1c681b35e081c1b297f47ed06815503f6ed7089a/source/funkin/menus/MainMenu.hx#L44
		  https://www.youtube.com/watch?v=l5EezdNNUpA&list=OLAK5uy_nRcI2Iv341VHAfMb6VxWu57r00QWwprQk&index=7
		  https://haxe.org/manual/expression-for.html
		  https://www.wiki.srb2.org/wiki/2D_mode

	 */
}
