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
var hpTrckHigest:Int; // Highetst point the HP meter can go to. (Hidden.)

var isPlayerWet:Bool = false; // Checks if the player is wet. Should be false unless in a water stage. Function provided for changing though.


//var timer:FlxTimer;
var timer2:FlxTimer;

var recoveryTimer:FlxTimer; // Time it takes for health to go back up.
var hpMoveTimer:FlxTimer; // Time it takes for health to go back up.

public var taken:Int; //For Damage.
public var hpMoveType:Int; // The 3 types.


	override function create() {

	hpTrckHigest = 0 - (hpTrckFloat * 8);
	trace(hpTrckHigest);

	var swggggdgdfgdf:BetaText;
	swggggdgdfgdf = new BetaText("TESTING HUD REMAKE", 30, 50, 1.0, -2, FlxTextAlign.LEFT);
	swggggdgdfgdf.updateHitbox();
	add(swggggdgdfgdf);


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

			hpTrackah = new HealthMeter("sonk", 108, hpTrckHigest, 170, -91, 1.0);
			// (meterType:String, insertedX:Int, insertedY:Int, hideX:Int, hideY:Int, insertedScale:Float)
			hpTrackah.updateHitbox();
			add(hpTrackah);

			/*FlxG.watch.add(hpTrackah, "text");*/

			timer2 = new FlxTimer();
			//timer2.start(1, bounce, 0);

			recoveryTimer = new FlxTimer(); // Timer used to recover health.

	}


	override function update(elapsed:Float){

	if (curHealth > 8) {
			curHealth = 8;
	}else if (curHealth < 0) {
			curHealth = 0;
	}

		hpMoveTimer = new FlxTimer();
		timer2.start(1, bounce, 0);
		showHPCount.text = curHealth + "";

		configHPCurAnim();

		//timer2.start(1, bounce, 2);
		if (FlxG.keys.justPressed.UP){
				curHealth += 1;
				//ex(50);
				if (curHealth > 7 && hpTrackah.y == hpTrckFloat){
					moveHP(0);
				}else{
					moveHP(1);
				}
		}
		else if (FlxG.keys.justPressed.DOWN ){
				//curHealth -= 1;
				damageHP(1);

					if (curHealth > 7){
						moveHP(2);
					}else{
						moveHP(1);
					}

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

	/*function sendUp(_:FlxTimer):Void{
		// Function that triggers the HP thing to go to back up after a few secs.
		// I'm not good with timers.

		if (curHealth == 8 && hpTrackah.y == hpTrckHigest){
		FlxTween.tween(hpTrackah, {x: hpTrackah.x, y: hpTrckHigest}, 0.1, {type: FlxTweenType.PERSIST});
		}

	}*/

	function sendUp(_:FlxTimer):Void{
		// Function that triggers the HP thing to go to back up after a few secs.
		// I'm not good with timers.

		if (curHealth == 8 && hpTrackah.y == hpTrckHigest){
		FlxTween.tween(hpTrackah, {x: hpTrackah.x, y: hpTrckHigest}, 0.1, {type: FlxTweenType.PERSIST});
		}

	}


	function moveHP(hpMoveType:Int):Void{
	// Hoping that the type can be determined as 0, 1, and 2.
	// 0 being offscreen, 1 being the top, and 2 being the middle (alas when you first take damage.)
	// Other notes: If the HP is alr onscreen, taking more damage won't make it move.
	// Enterring water brings the HP to the lowest part it can go to and moves it to the normal area, kinda like if you got damaged.
	//FlxG.log.add("Testing FLX logging say hi to: " + hpMoveType);


	switch curHealth {

		case 0:{ // Offscreen.

				var returnToSender:FlxTimer = new FlxTimer();
					returnToSender.start(2, sendUp, 0);
				}
		case 1:{ // Middle/default.

			FlxTween.tween(hpTrackah, {x: hpTrackah.x, y: hpTrckFloat}, 0.1, {type: FlxTweenType.PERSIST});

			}
		case 2:{ // Bottom/damage

			FlxTween.tween(hpTrackah, {x: hpTrackah.x, y: hpTrckLowest}, 0.1, {type: FlxTweenType.PERSIST});

			}
	}








	function healthMove(_:FlxTimer){

		if (curHealth > 8 && hpTrackah.y == hpTrckLowest){
				//recoveryTimer.start(5, bounce, curHealth - 8);
				// Go up.
				moveHP(1);

			}else if (curHealth >= 8 && hpTrackah.y == hpTrckFloat){
				//recoveryTimer.start(5, bounce, curHealth - 8);
				// Go away.
				moveHP(0);

			}

	}





	}

	function damageHP(taken:Int):Void{

	// this
	trace("Damaged: " + taken);
	if (curHealth > 7 && hpTrackah.y == hpTrckHigest){
			moveHP(3);
	}
	curHealth -= taken;



	}


}
