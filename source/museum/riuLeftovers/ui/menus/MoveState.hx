package ui.menus;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.util.FlxColor;
import flixel.FlxG;

import flixel.addons.display.shapes.FlxShapeBox;
import flixel.addons.display.shapes.FlxShapeCircle;
import flixel.addons.display.shapes.FlxShapeCross;

import flixel.math.FlxVelocity;

class MoveState extends FlxState {
	var baseBG:FlxSprite;

	public var firstImage:FlxShapeCircle;
	public var secondBacker:FlxShapeBox;
	public var thirdSlot:FlxShapeCross;
	public var fourthButFirst:FlxShapeCircle;
	var sprite:FlxSprite;

	private var g0Aangle:Float = 30;

	public var borderLeftX:Float = (FlxG.width / 2) - 170;
	public var borderRightX:Float = (FlxG.width / 2) + 170;

	public var borderUpY:Float = (124 / (FlxG.width / FlxG.height)) * 1.15;
	public var borderDownY:Float = ((FlxG.height - 124) / (FlxG.width / FlxG.height)) * 1.15;


	// The sprites that are set to change.

	override function create() {

		//trace("Random number from 0 to 5:   " + FlxG.random.int(0, 5) );

		Sys.println("Upper Border: " + borderUpY + " Lower Border: " + borderDownY);
		Sys.println(FlxG.width / FlxG.height);

		baseBG = new FlxSprite();
		baseBG.makeGraphic(1280, 720, 0xff7ec2ce);
		baseBG.screenCenter();
		baseBG.alpha = 0.75;
		add(baseBG); // baseBG stays still!

		var glossLine1 = new FlxSprite(Paths.image('UI/Options Menu/GlossLine'));
		glossLine1.scale.x = 0.5;
		glossLine1.updateHitbox();
		glossLine1.y = 34;
		glossLine1.x = 0;

		var glossLine2 = new FlxSprite(Paths.image('UI/Options Menu/GlossLine'));
		glossLine2.scale.x = 0.5;
		glossLine2.y = 34;
		glossLine2.x = FlxG.width / 2; // Screen width divided by two.
		glossLine2.flipX = true;
		glossLine2.updateHitbox();
		
		sprite = new FlxSprite();
		sprite.makeGraphic(128, 64, FlxColor.RED);
		sprite.screenCenter();
		add(sprite);

		firstImage = new FlxShapeCircle(70, 150, 25, {}, FlxColor.BLUE);
		firstImage.screenCenter(X);	
		//firstImage.alpha = 0.01;	

		secondBacker = new FlxShapeBox(70, 300, 50, 50, {}, FlxColor.BLUE);
		secondBacker.screenCenter(X);
		//secondBacker.alpha = 0.01;
		
		thirdSlot = new FlxShapeCross(70, 450, 50, 25, 50, 25, 0.5, 0.5, {}, FlxColor.PINK);
		thirdSlot.screenCenter(X);
		//thirdSlot.alpha = 0.01;
		
		fourthButFirst = new FlxShapeCircle(10, 70, 25, {}, FlxColor.BLUE);
		fourthButFirst.screenCenter(X);
		fourthButFirst.alpha = 0.01;
		
		add(firstImage);
		add(secondBacker);
		add(thirdSlot);
		//add(fourthButFirst);
		add(glossLine1);
		add(glossLine2);

		trace("Substate MenuItem.hx intiated!");
		openSubState(new MenuItem());
	
		moveNum1first();
	}

	function moveNum1first(){
		//firstImage.angle = FlxG.random.int(0, 360);
		firstImage.angle = FlxG.random.int(0, 360);
		g0Aangle = FlxG.random.int(0, 360);
		firstImage.velocity.copyFrom(FlxVelocity.velocityFromAngle(g0Aangle, 200));

	}

	function moveNum2first(){
		//firstImage.angle = FlxG.random.int(0, 360);
		secondBacker.angle = FlxG.random.int(0, 360);
		g0Aangle = FlxG.random.int(0, 360);
		secondBacker.velocity.copyFrom(FlxVelocity.velocityFromAngle(g0Aangle, 200));

	}

	override function update(elapsed:Float){
		super.update(elapsed);
		//sprite.velocity.x = 100;
		//firstImage.velocity.copyFrom(FlxVelocity.velocityFromAngle(g0Aangle, 200));

		if (FlxG.keys.anyPressed( [ESCAPE, BACKSPACE] ) )
			{
				FlxG.switchState(ui.menus.MoveState.new);
				//FlxG.stage.window.title = "Rap-It-Up";
				trace("Returning to Title.");
			}

			if ((firstImage.x < borderLeftX) || (firstImage.x > borderRightX)  ||  (firstImage.y < borderUpY) || (firstImage.y > borderDownY))
				{
					//trace("Yes.");
					firstImage.alpha -= 0.005;
				}
			if((firstImage.alpha < 0.1)){
				firstImage.velocity.x = 0;
				firstImage.velocity.y = 0;
				firstImage.x = FlxG.width / 2;
				firstImage.y = FlxG.height / 2;
				firstImage.alpha = 1; // This is to confirm the code worked.
				moveNum2first(); // This triggers the second.
			}

			if ((secondBacker.x < borderLeftX) || (secondBacker.x > borderRightX))
				{
					secondBacker.alpha -= 0.005;
				}
			if((secondBacker.alpha < 0.1)){
				secondBacker.velocity.x = 0;
				secondBacker.velocity.y = 0;
				secondBacker.x = FlxG.width / 2;
				secondBacker.y = FlxG.height / 2;
				secondBacker.alpha = 1; // This is to confirm the code worked.
				moveNum1first(); // This triggers the firsecond.
			}
	}

		//Notes to self:
			/*	
			I've decided the maximum X value for the sprite to be at full opacity be roughly 170.
			For the Y value, 124.
			Also, make the velocity go according to the sprite's size, so bigger = faster, smaller = slower.
			So its a size to speed ratio.

			Something like:
			if [sprite].x is less than 170 (or more than the width minus 170) then
				fade away
			end
			
			say if the velocity for a full sized sprite were to be 15
			then like, set it to be like
			sprite size divided by like [full size / 15] then yeah
			not sure, its 1:17 soon to be 1:18 am now it is

			*/

			// Half of the 720p (640) screen width is 640.
			// Subtract by 170 is 470.

			// Add 640 + 170 = 810

			//8/12/24:
			// The speed for fading away from up and down should be the same proportional to left and right.
			// My guess would to multiply the vertical borders via the height divided by the width.

}
