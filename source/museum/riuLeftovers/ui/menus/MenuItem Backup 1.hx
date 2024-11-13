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
import Math;

class MenuItem extends FlxSubState {
	var sprite:FlxSprite;

	public var daText:FlxText;
	public var areaPosition:Int = 3;
	public var expectedX:Int = 308;
	public var expectedY:Int = 317;

	// The sprites that are set to change.

	override function create() {
		var b2aseBG:FlxSprite;
		b2aseBG = new FlxSprite();
		b2aseBG.makeGraphic(1280, 720, 0xff000000);
		b2aseBG.screenCenter();
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

		sprite = new FlxSprite();
		var animationData = FlxAtlasFrames.fromSparrow(Paths.image('UI/Main Menu/menuPlay.png'), Paths.image('UI/Main Menu/menuPlay.xml'));
		sprite.frames = animationData;
		sprite.animation.add('playSelected', [0]);
		sprite.animation.add('playUnselected', [1]);
		// sprite.y = healthBar.y - (sprite.height / 2);
		sprite.scrollFactor.set();
		sprite.x = 308;
		sprite.y = 317;
		add(sprite);

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

	function travelTo() {
		if (sprite.x = expectedX) {
			FlxTween.tween(sprite, {x: expectedX, y: expectedY}, 1, {type: FlxTweenType.PERSIST, ease: FlxEase.quadInOut});
		}
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		daText.text = "X:" + sprite.x + "\nY:" + sprite.y + "\nP:" + areaPosition;

		if (FlxG.keys.anyPressed([ONE, FIVE])) {
			// sprite.x = 158;
		}
		if (FlxG.keys.anyPressed([FOUR, TWO])) {
			// sprite.x = 248;
		}

		if (FlxG.keys.anyPressed([THREE, C])) {
			// sprite.x = 308;
			// sprite.y = 317;
			areaPosition = 3;
		}

		if (FlxG.keys.anyPressed([ONE, A])) {
			// sprite.y = 27;
			areaPosition = 1;
		}
		if (FlxG.keys.anyPressed([TWO, B])) {
			// sprite.y = 167;
			areaPosition = 2;
		}
		if (FlxG.keys.anyPressed([FOUR, D])) {
			// sprite.y = 467;
			areaPosition = 4;
		}
		if (FlxG.keys.anyPressed([FIVE, E])) {
			// sprite.y = 617;
			areaPosition = 5;
		}

		// https://haxe.org/manual/expression-switch.html
		switch areaPosition {
			case 1:
				{
					expectedX = 158;
					expectedY = 27;
				}
			case 2:
				{
					expectedX = 248;
					expectedY = 167;
				}
			case 3:
				{
					expectedX = 308;
					expectedY = 317;
				}
			case 4:
				{
					expectedX = 248;
					expectedY = 467;
				}
			case 5:
				{
					expectedX = 158;
					expectedY = 617;
				}
				/*case default:{
					sprite.x = 308;
					sprite.y = 317;
				}*/
		}

		if (FlxG.keys.anyPressed([ONE, TWO, THREE, FOUR, FIVE, A, B, C, D, E])) {
			travelTo();
		}
	}

	// Notes to self:
	/*	
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
