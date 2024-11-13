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
	//public var areaPosition:Int = 3;
	public var expectedX:Int = 308;
	public var expectedY:Int = 317;

	// https://haxe.org/manual/expression-for.html
	// Play, Options, Extras, Info, and Exit.
	var menuPlay:FlxSprite;
	var menuOptions:FlxSprite;
	var menuExtras:FlxSprite;
	var menuInfo:FlxSprite;
	var menuExit:FlxSprite;

	var selectAbles:Array<String> = ["Play", "Options", "Extras", "Info", "Exit"];
	// Shoutouts to https://github.com/Ralsin/FNF-MintEngine/blob/1c681b35e081c1b297f47ed06815503f6ed7089a/source/funkin/menus/MainMenu.hx#L13 which helped me realize :Array<Spring> was.
	var currentlySelected:Int = 3;


	override function create() {

	var b2aseBG = new FlxSprite();
	b2aseBG.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
	b2aseBG.alpha = 0.75;
	add(b2aseBG); // baseBG stays still!

		trace("Substate MenuItem.hx is active!");

		/*

		There's likely better ways to make a menu like this, however this is my first true main menu done on my own without any code for the basis or whatever. (However reference code was used.)

		 Position and Opacity Info

		top - 158, 27, 50%
		halftop - 248, 167, 75%
		selected - center - 308, 317, 100%
		halfbottom - 248, 467, 75%
		bottom - 148, 617, 50% (tho may switch to 158 X)
		*/

		var createdEntries:Int = 0;
		for (createdEntries in selectAbles) {
			trace(createdEntries + " Entry");
			var menuItem:Int = 1; // The value of the current item. Play = 1, Exit = 5.
			var menuTitle:String = createdEntries; // The title of the entries created, Play, Options, etc.
			var menulowercase:String = menuTitle.toLowerCase(); // The entry's title in lowercase.

				var menuPrefix:String = "UI/Main Menu/menu"; // The directory to the main menu graphics.
				var animationData = FlxAtlasFrames.fromSparrow(Paths.image(menuPrefix + createdEntries + ".png"), Paths.image(menuPrefix + createdEntries +".xml")); // Applied info to animation data.

			/*
			menuPlay:FlxSprite; 3
			var menuOptions:FlxSprite; 4
			var menuExtras:FlxSprite; 5
			var menuInfo:FlxSprite; 1
			var menuExit; 2
	`		*/

			switch createdEntries{
			// To do: Make X and Y values go to the values in the selectX and Y strings. Though maybe done so in the create loop and onUpdate.
			// I'm thinking that maybe in the future if someone returns to the menu from say the options menu, then the options selection would stay selected until they move to a diff area, hence putting it into the create function too. Though I'm not sure on how this would work though. -E.A.
				case "Play":{
					menuPlay = new FlxSprite();
					menuPlay.frames = animationData;
					menuPlay.animation.add(menulowercase + 'Selected', [0]);
					menuPlay.animation.add(menulowercase + 'Unselected', [1]);
					menuPlay.x = 308;
					menuPlay.y = 317;
					//FlxTween.tween(sprite, {x: 308, y: 317}, 1, {type: FlxTweenType.PERSIST, ease: FlxEase.quadInOut});
					add(menuPlay);
				}
				case "Options":{
					menuOptions = new FlxSprite();
					menuOptions.frames = animationData;
					menuOptions.animation.add(menulowercase + 'Selected', [0]);
					menuOptions.animation.add(menulowercase + 'Unselected', [1]);
					menuOptions.x = 248;
					menuOptions.y = 467;
					add(menuOptions);
				}
				case "Extras":{
					menuExtras = new FlxSprite();
					menuExtras.frames = animationData;
					menuExtras.animation.add(menulowercase + 'Selected', [0]);
					menuExtras.animation.add(menulowercase + 'Unselected', [1]);
					menuExtras.x = 148;
					menuExtras.y = 617;
					add(menuExtras);
				}
				case "Info":{
					menuInfo = new FlxSprite();
					menuInfo.frames = animationData;
					menuInfo.animation.add(menulowercase + 'Selected', [0]);
					menuInfo.animation.add(menulowercase + 'Unselected', [1]);
					menuInfo.x = 158;
					menuInfo.y = 27;
					add(menuInfo);
				}
				case "Exit":{
					menuExit = new FlxSprite();
					menuExit.frames = animationData;
					menuExit.animation.add(menulowercase + 'Selected', [0]);
					menuExit.animation.add(menulowercase + 'Unselected', [1]);
					menuExit.x = 248;
					menuExit.y = 167;
					add(menuExit);
				}
			}
			createdEntries += 1;
		}


		//FlxTween.tween(sprite, {x: expectedX, y: expectedY}, 1, {type: FlxTweenType.PERSIST, ease: FlxEase.quadInOut});


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

	function onButtonClicked()
	{
		FlxG.camera.flash(FlxColor.WHITE, 0.33);
		//sprite.y = Math.cos(sprite.y/1.1)*90;
		//sprite.x = Math.cos(sprite.x/1.1)*90;
		/*
		var str = string.split('');
		str.push(str.unshift());
		string = str.join('');


		var str = string.split('');
		str.push(str.unshift());
		string = str.join('');*/

	}

	override function update(elapsed:Float){
		super.update(elapsed);

		daText.text = "SelectedA:" + currentlySelected;
		// https://haxe.org/manual/expression-switch.html

		if (FlxG.keys.anyPressed([UP, DOWN, W, S]))
		{
				travelTo(); // Triggers a function which sees either if UP/W or DOWN/S has been pressed and works accordingly.
		}

		//for (currentlySelected in selectAbles) {
			//currentlySelected // The value of the current item. Play = 1, Exit = 5.
			//currentlySelected in selectAbles // The current item.
			//switch currentlySelected
				//{
				if (currentlySelected = 1) {
					// Info

					menuInfo.alpha = 1;
					menuExit.alpha = 0.75;
					menuPlay.alpha = 0.5;
					menuOptions.alpha = 0.450;
					menuExtras.alpha = 0.400;

					}
				if (currentlySelected = 2) {
					// Exit

					menuInfo.alpha = 0.75;
					menuExit.alpha = 1.00;
					menuPlay.alpha = 0.75;
					menuOptions.alpha = 0.50;
					menuExtras.alpha = 0.45;

					}
				if (currentlySelected = 3) {
					//Play // Default

					menuInfo.alpha = 0.50;
					menuExit.alpha = 0.75;
					menuPlay.alpha = 1.00;
					menuOptions.alpha = 0.75;
					menuExtras.alpha = 0.50;

					}
				if (currentlySelected = 4) {
					// Options

					menuInfo.alpha = 0.45;
					menuExit.alpha = 0.50;
					menuPlay.alpha = 0.75;
					menuOptions.alpha = 1;
					menuExtras.alpha = 0.75;

					}
				if (currentlySelected = 5) {
					// Extras

					menuInfo.alpha = 0.40;
					menuExit.alpha = 0.45;
					menuPlay.alpha = 0.50;
					menuOptions.alpha = 0.75;
					menuExtras.alpha = 1;

					}
					/*case null:{
					menuPlay.alpha = 0;
					menuOptions.alpha = 0;
					menuExtras.alpha = 0;
					menuInfo.alpha = 0;
					menuExit.alpha = 0;
					}*/
				//}
		//}

	}


	function travelTo(){

		if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W)
			{
					currentlySelected += 1;
			}
		if (FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.S)
			{
					currentlySelected -= 1;
			}
		if (currentlySelected > selectAbles.length)
			currentlySelected = 1;
		if (currentlySelected < 1)
			currentlySelected = selectAbles.length;
	}

		/*Notes to self:

		*/


}
