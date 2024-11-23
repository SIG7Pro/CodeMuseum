package museum.sm64Elements;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;

import flixel.text.FlxBitmapText;
import flixel.graphics.frames.FlxBitmapFont;

import museum.sm64Elements.BetaText;

// Explanation for how hud-types work will be included in the readme of the hudTypes folder.

class B3313Huds extends FlxState
{
     var swggggdgdfgdf:BetaText;

	var beie02Letters:String = "0123456789" + "ABCDEFGHIJKLMNOPRSTUWYZs"; // Contains some extra letters not seen in 0.2 of B3313 and some letters aren't seen there. Temporary.
	 var backRef:FlxSprite;

	 var imageLocation:String = "assets/images/b3313HUD/";
	 var referenceType:String = "Not Worthy (Attempt)";

	 var lifeCount:Int;
	 var starCount:Int;
	 var coinCount:Int;


	override public function create()
	{

		var sprite = new FlxSprite();
		sprite.makeGraphic(FlxG.width, FlxG.height, FlxColor.PINK);
		sprite.screenCenter();
		add(sprite);

		backRef = new FlxSprite();
		backRef.loadGraphic(imageLocation + "references/" + referenceType + ".png");
		//backRef.screenCenter();
		backRef.alpha = 0.5;
		add(backRef);




		var fontXNA = FlxBitmapFont.fromXNA(imageLocation + "font/betaLetters-0.2-XNA.png", beie02Letters);


		if (referenceType == "Not Worthy (Attempt)"){
			swggggdgdfgdf = new BetaText("YOU ARE WORTHY", 51, 104, 1.0, -4, FlxTextAlign.CENTER);
			//swggggdgdfgdf.screenCenter(X);
			swggggdgdfgdf.updateHitbox();
		}
		else if (referenceType == "Shoshinkai"){

				//lifeCount = 02;
				starCount = 45;
				coinCount = 20;
				openSubState(new museum.sm64Elements.hudTypes.SSKHud());

				/*var purple = new BetaText("YOU ARE NOT WORTHY", 53, 104, 1.0, -4, FlxTextAlign.LEFT);
				purple.scale.y = MathUtil.percent(61.33);
				purple.updateHitbox();
				purple.y = -138;
				add(purple); // Todo: Put life counter here.*/

		}
		else if (referenceType == "B-ROLL"){
				openSubState(new museum.sm64Elements.hudTypes.BRollHuds());
		}
		else if (referenceType == "December (Attempt)"){
				openSubState(new museum.sm64Elements.hudTypes.December95());
		}
		else if (referenceType == "E3 1996"){
				openSubState(new museum.sm64Elements.hudTypes.E396());
		}
		else
		{
				swggggdgdfgdf = new BetaText("SUPER ABCDEFGH BROWS", 30, 50, 1.0, -1, FlxTextAlign.CENTER);
				swggggdgdfgdf.updateHitbox();
		}

		if (referenceType == "Not Worthy (Attempt)"){
		swggggdgdfgdf.alignment = FlxTextAlign.LEFT;
		add(swggggdgdfgdf);
		}



		/*#if debug
		FlxG.watch.add(swggggdgdfgdf, "text");
		FlxG.watch.add(swggggdgdfgdf, "x");
		FlxG.watch.add(swggggdgdfgdf, "y");
		FlxG.watch.add(swggggdgdfgdf, "insertedScale");
		FlxG.watch.add(swggggdgdfgdf, "insertedPadding");
		FlxG.watch.add(swggggdgdfgdf, "insertedAlign");
		#end*/



	}

	function healthMove()
	{
	// Determines if the health goes up when the player is at full health* or if it should go down, say the player is hurt.
	// *Note, I have no reason for this, but there's triggers for touching poison and for touching water. These would disable it from going up normally.

	}


	/*inline static public function getSparrowAtlas(key:String, ?library:String)
	{
		return FlxAtlasFrames.fromSparrow(image(key, library), file('images/$key.xml', library)); // https://github.com/FunkinCrew/Funkin/blob/legacy/0.2.x/source/Paths.hx
	}*/


}
