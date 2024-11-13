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
	var selectX:Array<Int> = [308, 248, 148, 158, 248];
	var selectY:Array<Int> = [317, 467, 617, 27, 167];
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
					//menuPlay.x = (createdEntries in selectX);
					//menuPlay.y = (createdEntries in selectY);
					trace("menuPlay created at:" + menuPlay.x + ", " + menuPlay.y + ". Expected:" + (createdEntries) + ", " + (createdEntries));
					FlxTween.tween(sprite, {x: 308, y: 317}, 1, {type: FlxTweenType.PERSIST, ease: FlxEase.quadInOut});
					add(menuPlay);
				}
				case "Options":{
					menuOptions = new FlxSprite();
					menuOptions.frames = animationData;
					menuOptions.animation.add(menulowercase + 'Selected', [0]);
					menuOptions.animation.add(menulowercase + 'Unselected', [1]);
					//menuOptions.x = 248;
					//menuOptions.y = 467;
					add(menuOptions);
				}
				case "Extras":{
					menuExtras = new FlxSprite();
					menuExtras.frames = animationData;
					menuExtras.animation.add(menulowercase + 'Selected', [0]);
					menuExtras.animation.add(menulowercase + 'Unselected', [1]);
					//menuExtras.x = 148;
					//menuExtras.y = 617;
					add(menuExtras);
				}
				case "Info":{
					menuInfo = new FlxSprite();
					menuInfo.frames = animationData;
					menuInfo.animation.add(menulowercase + 'Selected', [0]);
					menuInfo.animation.add(menulowercase + 'Unselected', [1]);
					//menuInfo.x = 158;
					//menuInfo.y = 27;
					add(menuInfo);
				}
				case "Exit":{
					menuExit = new FlxSprite();
					menuExit.frames = animationData;
					menuExit.animation.add(menulowercase + 'Selected', [0]);
					menuExit.animation.add(menulowercase + 'Unselected', [1]);
					//menuExit.x = 248;
					//menuExit.y = 167;
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


		// I see some code on some comments on the Haxe Manual for Arrays that I'm wondering could be used, so I might see if its possible.
		// Basically their setup has the Array (movementVector) set up, with a variable called isMoving being set to true.

		// What I see is the calues of the array being changed on if statements.
		// The code is as follows

		/*

		var movementVector: Array<Int> = [0, 0];
        var isMoving = true;
        if (hxd.Key.isDown(hxd.Key.UP)) {
            movementVector = [0, -1];
        } else if (hxd.Key.isDown(hxd.Key.DOWN)) {
            movementVector = [0, 1];
        } else if (hxd.Key.isDown(hxd.Key.LEFT)) {
            movementVector = [-1, 0];
        } else if (hxd.Key.isDown(hxd.Key.RIGHT)) {
            movementVector = [1, 0];
        } else {
            isMoving = false;
        }

        if (isMoving) {
            // Do stuff here
        }



        Which is a rewrite of some other code left by another commenter. If arrays can be edited this way, shoutouts to markknol and joereynolds.

		My take on the code below might be crude however.
		*/

		for (currentlySelected in selectAbles) {
			//Saves manually doing if cases, though unsure if this is longer.
			switch currentlySelected{
				case "3":{
				//Play // Default
				selectAbles = ["Play", "Options", "Extras", "Info", "Exit"];
				selectX = [308, 248, 148, 158, 248];
				selectY = [317, 467, 617, 27, 167];

				}
				case "4":{
				// Options
				selectAbles = ["Options", "Extras", "Info", "Exit", "Play"];
				selectX = [248, 148, 158, 248, 308];
				selectY = [467, 617, 27, 167, 317];

				}
				case "5":{
				// Extras
				selectAbles = ["Extras", "Info", "Exit", "Play", "Options"];
				selectX = [148, 158, 248, 308, 248];
				selectY = [617, 27, 167, 317, 467];

				}
				case "1":{
				// Info
				selectAbles = ["Info", "Exit", "Play", "Options", "Extras"];
				selectX = [158, 248, 308, 248, 148];
				selectY = [27, 167, 317, 467, 617];

				}
				case "2":{
				// Exit
				selectAbles = ["Exit", "Play", "Options", "Extras", "Info"];
				selectX = [248, 308, 248, 148, 158];
				selectY = [167, 317, 467, 617, 27];

				}
			}



	}


	override function update(elapsed:Float){
		super.update(elapsed);

		daText.text = "SelectedA:" + currentlySelected/* + "\nY:" + sprite.y + "\nP:" + areaPosition*/;
		// https://haxe.org/manual/expression-switch.html

		if (FlxG.keys.anyPressed([UP, DOWN, W, S]))
		{
				travelTo();
		}


		for (currentlySelected in selectAbles) {
			//var selectedItem:Int = 1; // The value of the current item. Play = 1, Exit = 5.
			//var selected:String = currentlySelected; // The title of the entries created, Play, Options, etc.
			switch currentlySelected
				{
					case "1":{
					// Info


					}
					case "2":{
					// Exit


					}
					case "3":{
					//Play // Default


					}
					case "4":{
					// Options


					}
					case "5":{
					// Extras


					}
				}

		}


				// SelectX and SelectY arrays match up with the selectAbles array.
				// 0 to 4.

				menuPlay.x = (selectX[0]);
				menuPlay.y = (selectY[0]);

				menuOptions.x = (selectX[1]);
				menuOptions.y = (selectY[1]);

				menuExtras.x = (selectX[2]);
				menuExtras.y = (selectY[2]);

				menuInfo.x = (selectX[3]);
				menuInfo.y = (selectY[3]);

				menuExit.x = (selectX[4]);
				menuExit.y = (selectY[4]);




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
