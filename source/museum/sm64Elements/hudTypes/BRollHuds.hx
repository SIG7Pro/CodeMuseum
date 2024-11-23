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

import Std;

class BRollHuds extends FlxSubState {

var lives:Int = 2;
var stars:Int = 45;
var coins:Int = 20; // Stats

var lifeStr:String;
var starStr:String;
var coinStr:String; // Stats (Strings)

var lifeCounter:BetaNum;
var starCounter:BetaNum;
var coinCounter:BetaNum;
var lifeCross:BetaInfs;
var starCross:BetaInfs;
var coinCross:BetaInfs;
var lifeIcon:StatIcons;
var starIcon:StatIcons;
var coinIcon:StatIcons;
var hpTrackah:HealthMeter;
var curHealth:Int = 8;
var hpTrckLowest:Int = 41;
var hpTrckFloat:Int = 7;
var hpTrckHighest:Int;
var isPlayerWet:Bool = false;
var hpChange:Int;
public var hpMoveType:Int;

var a:FlxTween; //shoutouts to Cobalt
var chunkyHPReturn:Bool = false; // If set to true, when the HP meter is at the bottom and more HP is lost, then it quickly goes to the center.

var meterType:Int = 1; // Checks which version of the B-Roll hud is using. So far just broll1 and broll2.


	override function create() {

	hpTrckHighest = 0 - (hpTrckFloat * 8);
	trace(hpTrckHighest);

			var numberStyle:String = "betaNums"; // Placed in the create function, as it isn't intended to change.

			lifeCounter = new BetaNum(numberStyle, lives, 58, 14, 1.0, -4, FlxTextAlign.LEFT);
			lifeCounter.updateHitbox();
			add(lifeCounter);

			lifeCross = new BetaInfs("betaCross", 46, 14, 1.0);
			lifeCross.updateHitbox();
			add(lifeCross);

			lifeIcon = new StatIcons("mario", 30, 14, 1.0);
			lifeIcon.updateHitbox();
			add(lifeIcon);

			//timer = new FlxTimer();


			starCounter = new BetaNum(numberStyle, stars, 198, 14, 1.0, -4, FlxTextAlign.LEFT);
			starCounter.updateHitbox();
			add(starCounter);

			starCross = new BetaInfs("betaCross", 186, 14, 1.0);
			starCross.updateHitbox();
			add(starCross);

			starIcon = new StatIcons("star", 170, 14, 1.0);
			starIcon.updateHitbox();
			add(starIcon);

			coinCounter = new BetaNum(numberStyle, coins, 198, 31, 1.0, -4, FlxTextAlign.LEFT);
			coinCounter.updateHitbox();
			add(coinCounter);

			coinCross = new BetaInfs("betaCross", 186, 31, 1.0);
			coinCross.updateHitbox();
			add(coinCross);

			coinIcon = new StatIcons("coin", 170, 31, 1.0);
			coinIcon.updateHitbox();
			add(coinIcon);

			hpTrackah = new HealthMeter('broll$meterType', 108, hpTrckHighest, 170, -91, 1.0);
			hpTrackah.updateHitbox();
			hpTrackah.alpha = 0.865; //Note: this was the closest thing I could get to the transparency. Used the castle grounds for reference. (The cave.)
			add(hpTrackah);


			FlxG.watch.add(hpTrackah, "x");
			FlxG.watch.add(hpTrackah, "y");

			FlxG.watch.add(lifeCounter, "text");
			/*FlxG.watch.add(starIcon, "x");
			FlxG.watch.add(starIcon, "y");

			FlxG.watch.add(coinIcon, "text");
			FlxG.watch.add(coinIcon, "x");
			FlxG.watch.add(coinIcon, "y");*/

			//FlxG.watch.add(health, "HP");

	}

	function updateVisibleStats(){

	if (lives < 10){
			lifeStr = "0" + lives;
		}else if (lives > 9){
			lifeStr = '$lives';
		}
		lifeCounter.text = lifeStr;
		//trace(lifeCounter.text = lifeStr);

	if (stars < 10){
			starStr = "0" + stars;
		}else if (stars > 9){
			starStr = '$stars';
		}
		starCounter.text = starStr;
		//trace(starCounter.text = starStr);
	if (stars < 0) {
			stars = 0; // Nobody should be getting negative stars. Even then, the number class lacks a minus symbol.
		 }

	if (coins < 10){
			coinStr = "0" + coins;
		}else if (coins > 9){
			coinStr = '$coins';
		}
		coinCounter.text == lifeStr;
		//trace(coinCounter.text = coinStr);
	if (coins < 0) {
			coins = 0;
		 }

	}

	function alterStats(){

		#if debug
		if (FlxG.keys.anyPressed( [ONE, U] ) )
				{
				stars += 1;

				}
		if (FlxG.keys.anyPressed( [TWO, I] ) )
				{
				stars -= 1;
				}
		if (FlxG.keys.anyPressed( [THREE, O] ) )
				{
				lives += 1;

				}
		if (FlxG.keys.anyPressed( [FOUR, P] ) )
				{
				lives -= 1;
				}
		if (FlxG.keys.anyPressed( [FIVE, J] ) )
				{
				coins += 1;

				}
		if (FlxG.keys.anyPressed( [SIX, K] ) )
				{
				coins -= 1;
				}
		#end
		/*coinCounter.text = '$coins';
		starCounter.text = '$stars';
		lifeCounter.text = '$lives';*/

		if (coins > 99){
		coins = (coins - 99);
		lives += 1;
		}
	}

	override function update(elapsed:Float){
		configHPCurAnim();
		alterStats();
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

		 updateVisibleStats();

		// Checks if the life text is below 10 and extends it if so.
		 /*if (starCounter.text == "" + stars && stars < 10) {
			starCounter.text = "0" + stars;
		 }else{
			starCounter.text = "" + stars;
		 }*/



		//trace(lives < 10);
		//trace(lifeStr.length);
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
