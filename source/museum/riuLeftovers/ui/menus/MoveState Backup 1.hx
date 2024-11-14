package ui.menus;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.addons.display.shapes.FlxShapeBox;
import flixel.addons.display.shapes.FlxShapeCircle;
import flixel.addons.display.shapes.FlxShapeCross;

class MoveState extends FlxState {
	var baseBG:FlxSprite;

	public var firstImage:FlxShapeCircle;
	public var secondBacker:FlxShapeBox;
	public var thirdSlot:FlxShapeCross;
	public var fourthButFirst:FlxShapeCircle;

	// The sprites that are set to change.

	override function create() {
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

		firstImage = new FlxShapeCircle(70, 150, 25, {}, FlxColor.BLUE);
		firstImage.screenCenter(X);
		// firstImage.alpha = 0.01;
		add(firstImage);

		secondBacker = new FlxShapeBox(70, 300, 50, 50, {}, FlxColor.BLUE);
		secondBacker.screenCenter(X);
		// secondBacker.alpha = 0.01;
		add(secondBacker);

		thirdSlot = new FlxShapeCross(70, 450, 50, 25, 50, 25, 0.5, 0.5, {}, FlxColor.PINK);
		thirdSlot.screenCenter(X);
		// thirdSlot.alpha = 0.01;
		add(thirdSlot);

		fourthButFirst = new FlxShapeCircle(10, 70, 25, {}, FlxColor.BLUE);
		fourthButFirst.screenCenter(X);
		fourthButFirst.alpha = 0.01;
		// add(fourthButFirst);

		add(glossLine1);
		add(glossLine2);
	}

	function moveNum1first() {}

	function num2fadein(_):Void {}

	function num3fadein(_):Void {}

	function num4fadein(_):Void {}

	function noEvent(_):Void {}

	override function update(elapsed:Float) {
		/*if (FlxG.keys.anyPressed( [ESCAPE, BACKSPACE] ) )
			{
				FlxG.switchState(ui.menus.TitleState.new);
				FlxG.stage.window.title = "Rap-It-Up";
				trace("Returning to Title.");
		}*/
	}
}
