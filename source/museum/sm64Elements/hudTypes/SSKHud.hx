package museum.sm64Elements.hudTypes;

import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSubState;

import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

import Math;

import museum.sm64Elements.BetaNum; // Numbers
import museum.sm64Elements.BetaInfs; // Crosses.


class SSKHud extends FlxSubState {

var lives:Int = 2;
var stars:Int = 44;
var coins:Int = 0;

var lifeCount:BetaNum;
var starCount:BetaNum;
var coinCount:BetaNum;

var lifeCross:BetaInfs;
var starCross:BetaInfs;
var coinCross:BetaInfs;


	override function create() {

			var numberStyle:String = "betaNums"; // Placed in the create function, as it isn't intended to change.
			var xStyle:String = "betaType";

			//lifeCount = new BetaNums("YOU ARE NOT WORTHY", 53, 104, 1.0, -4, FlxTextAlign.CENTER);
			// public function new(numberType:String, insertedText:Int, insertedX:Int, insertedY:Int, insertedScale:Float, insertedSpacing:Int, insertedAlign:FlxTextAlign)
			lifeCount = new BetaNum(numberStyle, lives, 60, 14, 1.0, -4, FlxTextAlign.LEFT);
			// To keep as numType, value, x + y, scale + spacing + alignment, or to change it?
			lifeCount.updateHitbox();
			add(lifeCount);


			//lifeCross = new BetaInfs(xStyle, 7, 70, 14, 1.0, -4, FlxTextAlign.LEFT);
			// public function new(symbolType:Int, insertedX:Int, insertedY:Int, insertedScale:Float, insertedSpacing:Int, insertedAlign:FlxTextAlign)
			// new(informalType/CrossType, thing exactly, x, y, scale, spacing (basically meaningless), alignment (also meaningless))
			//lifeCross = new BetaInfs(7, 70, 14, 1.0, -4, FlxTextAlign.LEFT);
			//lifeCross.text = "A";

			lifeCross = new BetaInfs("betaCrossSSK", 46, 14, 1.0);
			lifeCross.updateHitbox();
			add(lifeCross);




			starCount = new BetaNum(numberStyle, stars, 200, 14, 1.0, -4, FlxTextAlign.LEFT);
			starCount.updateHitbox();
			add(starCount);

			starCross = new BetaInfs("betaCrossSSK", 186, 14, 1.0);
			starCross.updateHitbox();
			add(starCross);

			coinCount = new BetaNum(numberStyle, coins, 200, 31, 1.0, -4, FlxTextAlign.LEFT);
			coinCount.updateHitbox();
			add(coinCount);

			coinCross = new BetaInfs("betaCrossSSK", 186, 31, 1.0);
			coinCross.updateHitbox();
			add(coinCross);





			FlxG.watch.add(lifeCross, "text");
			FlxG.watch.add(lifeCross, "x");
			FlxG.watch.add(lifeCross, "y");

			/*FlxG.watch.add(starCount, "text");
			FlxG.watch.add(starCount, "x");
			FlxG.watch.add(starCount, "y");

			FlxG.watch.add(coinCount, "text");
			FlxG.watch.add(coinCount, "x");
			FlxG.watch.add(coinCount, "y");*/

	}

}
