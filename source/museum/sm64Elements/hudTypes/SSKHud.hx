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
import museum.sm64Elements.BetaInfs; // Crosses
import museum.sm64Elements.StatIcons; // Icons
import museum.sm64Elements.HealthMeter; // Health Meter

import flixel.util.FlxTimer;

class SSKHud extends FlxSubState {

var lives:Int = 2;
var stars:Int = 44;
var coins:Int = 0;

var lifeCount:BetaNum;
var starCount:BetaNum;
var coinCount:BetaNum;
var showHPCount:BetaNum;

var lifeCross:BetaInfs;
var starCross:BetaInfs;
var coinCross:BetaInfs;

var lifeIcon:StatIcons;
var starIcon:StatIcons;
var coinIcon:StatIcons;

var curHealth:Int = 8;

var hpTrackah:HealthMeter;

var hpTrckLowest:Int = 2;
var hpTrckMiddle:Int = 44;
var hpTrckHigest:Int = 0;

var isPlayerWet:Bool = false;
//var timer:FlxTimer;
var timer2:FlxTimer;


	override function create() {

	hpTrckHigest = 0 - hpTrckMiddle;

			var numberStyle:String = "betaNums"; // Placed in the create function, as it isn't intended to change.
			var xStyle:String = "betaType";

			lifeCount = new BetaNum(numberStyle, lives, 60, 14, 1.0, -4, FlxTextAlign.LEFT);
			lifeCount.updateHitbox();
			add(lifeCount);

			showHPCount = new BetaNum(numberStyle, curHealth, 60, 31, 1.0, -4, FlxTextAlign.LEFT);
			showHPCount.updateHitbox();
			add(showHPCount);

			lifeCross = new BetaInfs("betaCrossSSK", 46, 14, 1.0);
			lifeCross.updateHitbox();
			add(lifeCross);

			lifeIcon = new StatIcons("bf", 30, 14, 1.0);
			lifeIcon.updateHitbox();
			add(lifeIcon);

			//timer = new FlxTimer();


			starCount = new BetaNum(numberStyle, stars, 200, 14, 1.0, -4, FlxTextAlign.LEFT);
			starCount.updateHitbox();
			add(starCount);

			starCross = new BetaInfs("betaCrossSSK", 186, 14, 1.0);
			starCross.updateHitbox();
			add(starCross);

			starIcon = new StatIcons("star", 170, 14, 1.0);
			starIcon.updateHitbox();
			add(starIcon);

			coinCount = new BetaNum(numberStyle, coins, 200, 31, 1.0, -4, FlxTextAlign.LEFT);
			coinCount.updateHitbox();
			add(coinCount);

			coinCross = new BetaInfs("betaCrossSSK", 186, 31, 1.0);
			coinCross.updateHitbox();
			add(coinCross);

			coinIcon = new StatIcons("coin", 170, 31, 1.0);
			coinIcon.updateHitbox();
			add(coinIcon);

			hpTrackah = new HealthMeter("sonk", 108, 42, 170, -91, 1.0);
			// (meterType:String, insertedX:Int, insertedY:Int, hideX:Int, hideY:Int, insertedScale:Float)
			hpTrackah.updateHitbox();
			add(hpTrackah);

			/*FlxG.watch.add(hpTrackah, "text");
			FlxG.watch.add(hpTrackah, "x");
			FlxG.watch.add(hpTrackah, "y");

			FlxG.watch.add(starIcon, "text");
			FlxG.watch.add(starIcon, "x");
			FlxG.watch.add(starIcon, "y");

			FlxG.watch.add(coinIcon, "text");
			FlxG.watch.add(coinIcon, "x");
			FlxG.watch.add(coinIcon, "y");*/

			//FlxG.watch.add(health, "HP");

			timer2 = new FlxTimer();
			//var timer2:FlxTimer = new FlxTimer().start(3.0, ()->{ FlxG.log.add("The FlxTimer has finished"); });
			//timer2.start(5, bounce, 0);
			//timer2.start(1, bounce, 0);

	}


	override function update(elapsed:Float){
		healthCheck();
		showHPCount.text = curHealth + "";
		//timer2.start(1, bounce, 2);
		if (FlxG.keys.anyPressed( [W, UP] ) )
				{
				curHealth += 1;

				}
		if (FlxG.keys.anyPressed( [S, DOWN] ) )
				{
				curHealth -= 1;
				}
		 if (curHealth > 8) {
			curHealth = 8;
		 }
		 if (curHealth > 8) {
			curHealth = 8;
		 }else if (curHealth < 0) {
			curHealth = 0;
		 }



	}


	function healthCheck(){


			//timer.start(5, bounce, 0);

    //hp = health; // set new hp to health

		switch curHealth {
		case 8:
			hpTrackah.animation.play('8');
		case 7:
			hpTrackah.animation.play('7');
		case 6:
			hpTrackah.animation.play('6');
		case 5:
			hpTrackah.animation.play('5');
		case 4:
			hpTrackah.animation.play('4');
		case 3:
			hpTrackah.animation.play('3');
		case 2:
			hpTrackah.animation.play('2');
		case 1:
			hpTrackah.animation.play('1');
		case 0:
			hpTrackah.animation.play('0');
		}

	}


	function bounce(_:FlxTimer):Void{

	// Intentions for this: tween to top if full and not wet.
	// Tween
	// 2 seconds for HP bar to go away when full HP
	// Looking at a slightly diff power meter thing (BRoll1) gives the farthest down Y to be 41, and the standard Y to be 7.
	// The one prev set in here seems to be at the bottom-most. Taking note of this.
	trace("Function working");



	}

}
