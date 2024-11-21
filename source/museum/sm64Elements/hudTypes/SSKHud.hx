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
var coins:Int = 0; // Stats

var lifeCount:BetaNum;
var starCount:BetaNum;
var coinCount:BetaNum; // Stat counters.
var showHPCount:BetaNum;

var lifeCross:BetaInfs;
var starCross:BetaInfs;
var coinCross:BetaInfs; // Stat fancifiers.

var lifeIcon:StatIcons;
var starIcon:StatIcons;
var coinIcon:StatIcons; // Stat icons.

var hpTrackah:HealthMeter; // Health Meter
var curHealth:Int = 8; // Health (Max: 8, Min: 0)

var hpTrckLowest:Int = 41; // Lowest point the HP meter can go to.
var hpTrckFloat:Int = 7; // Standard location for the HP meter.)
var hpTrckHighest:Int; // Highetst point the HP meter can go to. (Hidden.)

var isPlayerWet:Bool = false; // Checks if the player is wet. Should be false unless in a water stage. Function provided for changing though.

var hpChange:Int;

public var taken:Int; //For Damage.
public var hpMoveType:Int; // The 3 types.

var a:FlxTween; //shoutouts to Cobalt
var chunkyHPReturn:Bool = false; // If set to true, when the HP meter is at the bottom and more HP is lost, then it quickly goes to the center.

	override function create() {

	hpTrckHighest = 0 - (hpTrckFloat * 8);
	trace(hpTrckHighest);

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

			hpTrackah = new HealthMeter("sonk", 108, hpTrckHighest, 170, -91, 1.0);
			hpTrackah.updateHitbox();
			hpTrackah.alpha = 0.84; //Note: this was the closest thing I could get to the transparency. Used a stage with a solid color BG to compare. Very close. 86.5 percent for BRoll1.
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

	}


	override function update(elapsed:Float){
		configHPCurAnim();
		showHPCount.text = curHealth + "";
		if (FlxG.keys.justPressed.UP){

			hpRise(1);

		}
		else if (FlxG.keys.justPressed.DOWN ){

			hpLower(1);

		}

		// Essential code!
		if (curHealth > 8) {
			curHealth = 8;
		 }
		 if (curHealth > 8) {
			curHealth = 8;
		 }else if (curHealth < 0) {
			curHealth = 0;
		 }
		// Essential code!




		if (curHealth < 8 && hpTrackah.y > hpTrckLowest - 1){
		// Checks to see if the health is 8 and if the HP meter is above the float/lowest points.
			var gotoFloat:FlxTimer = new FlxTimer();
			gotoFloat.start(2, sendCenter, 0);

				if (gotoFloat.finished == true){
				trace("Test");
				gotoFloat.active = false;
				gotoFloat.cancel();
				}
		}else if (curHealth == 8 && hpTrackah.y == hpTrckFloat){
			trace("Full health. Going up!");
			moveHP(0);

		}





	}


	function configHPCurAnim(){
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

	// Example function for timers.

	// Intentions for this: tween to top if full and not wet.
	// Tween
	// 2 seconds for HP bar to go away when full HP
	// Looking at a slightly diff power meter thing (BRoll1) gives the farthest down Y to be 41, and the standard Y to be 7.
	// The one prev set in here seems to be at the bottom-most. Taking note of this.
	trace("Function working");

	}

	function sendUp1(_:FlxTimer):Void{
		// Function that triggers the HP thing to go to back up after a few secs.
		// I'm not good with timers.

		if (curHealth == 8 && hpTrackah.y == hpTrckHighest){
		FlxTween.tween(hpTrackah, {x: hpTrackah.x, y: hpTrckHighest}, 0.1, {type: FlxTweenType.PERSIST});
		}

	}


	function moveHP(hpMoveType:Int):Void{

		switch hpMoveType {

			case 0:{ // Offscreen.


			if (curHealth > 7 && isPlayerWet == false){
				trace("Movetype 0 Initiated.");
				var returnToSender:FlxTimer = new FlxTimer();
				returnToSender.start(2, sendUp, 0);
				trace("MT0 Code Over.");
			}else{
				trace("Either the player's health is 8+ and/or are wet.");
			}



					}
			case 1:{ // Middle/default.

					//if (isPlayerWet == false){
					FlxTween.tween(hpTrackah, {x: hpTrackah.x, y: hpTrckFloat}, 0.1, {type: FlxTweenType.PERSIST});
					//}

				}
			case 2:{ // Bottom/damage

				FlxTween.tween(hpTrackah, {x: hpTrackah.x, y: hpTrckLowest}, 0.1, {type: FlxTweenType.PERSIST});


				/*if (curHealth < 8){ // Less than 8 HP.
					/*trace("Movetype 1 Initiated.");
					var returnToSender:FlxTimer = new FlxTimer();
					returnToSender.start(2, sendUp, 0);
					trace("MT0 Code Over.");
				}else if (curHealth == 8){ // 8 HP.

					moveHP(0);
					trace("Up!");
				//

				var gotoFloat:FlxTimer = new FlxTimer();
				gotoFloat.start(2, sendCenter, 0);

				//moveHP(1);

				}else{
					trace("Where would this trace go?");
				}*/



			}

		}
	}


	function hpLower(hpChange:Int):Void{

	// this
	if (curHealth == 8 && hpTrackah.y < hpTrckFloat && chunkyHPReturn == true){
		// Checks to see if the health is 8 and if the HP meter is above the float/lowest points.
			//trace("HP Meter going up! (Position 1)");
			// go to hpTrckFloat
			moveHP(2);
	}else if (curHealth == 8 && hpTrackah.y < hpTrckFloat && chunkyHPReturn == false){
		// Checks to see if the health is 8 and if the HP meter is above the float/lowest points.
			//trace("HP Meter going up! (Position 1)");
			// go to hpTrckFloat
			FlxTween.tween(hpTrackah, {x: hpTrackah.x, y: hpTrckLowest}, 0.15,);
	}


	trace("Lowered by: " + hpChange);
	curHealth -= hpChange;



		if (curHealth < 8 && hpTrackah.y == hpTrckLowest){
		// If it's set to check for the Y value under the var, then it instead goes to area 1 instead of 2 first.
			//trace("HP Meter going up! (Position 1)");
			// go to hpTrckFloat
			moveHP(1);
		}

		//if (curHealth < 8){
			
		//}




	}

	function hpRise(hpChange:Int):Void{

	// this
	trace("Upped by: " + hpChange);
	curHealth += hpChange;

		if (curHealth == 8 && hpTrackah.y == hpTrckFloat){
			trace("Full health. Going up!");
			moveHP(0);

		}


	}


		function sendUp(_:FlxTimer):Void{
		trace("SendUP Initiated.");
		// Function that triggers the HP thing to go to back up after a few secs.
		// I'm not good with timers.

			if (curHealth == 8){
			a = FlxTween.tween(hpTrackah, {x: hpTrackah.x, y: hpTrckHighest}, 0.1);

			trace("Tween should be over..");

				if (a.finished == true || hpTrackah.y == hpTrckHighest){
				a.cancel();
				trace("Tween cancelled. (Unneeded.)");
				a.cancelChain();
				trace("Tween cancelled from chain. (Unneeded.)");
				a.destroy();
				trace("Tween destroyed.");
				}
			}

		}

		/*// Copy of the above but slightly ajusted so it's likely just as band-aided.
		function sendCenter(_:FlxTimer):Void{
		trace("SendCenter Initiated.");

			if (curHealth < 8){
			a = FlxTween.tween(hpTrackah, {x: hpTrackah.x, y: hpTrckFloat}, 0.1);

			trace("Tween should be over..");

				if (a.finished == true || hpTrackah.y == hpTrckHighest){
				a.cancel();
				trace("Tween cancelled. (Unneeded.)");
				a.cancelChain();
				trace("Tween cancelled from chain. (Unneeded.)");
				a.destroy();
				trace("Tween destroyed.");
				}
			}

		}*/

		function sendCenter(_:FlxTimer):Void{
		trace("SendCenter Initiated.");

			if (curHealth < 8){
				moveHP(1);
			}

		}


}
