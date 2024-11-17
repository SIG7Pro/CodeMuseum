package museum.sm64Elements;

import flixel.text.FlxText;
import flixel.text.FlxBitmapText;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.text.FlxText;
import flixel.text.FlxText.FlxTextAlign;
import Math;

class BetaNum extends FlxBitmapText {
    public var one:String;
    public var two:String;

    /*Note: the numbers lack minus signs, but most people won't really need those anyway.*/

	public var numberType:String = "betaNums"; // In B3313, there's a chance you get a beta styled hud (Shinshokai, the B-Roll huds) and there's a chance to get a pre-final hud (Like the Demo 1995, E3 huds). This allows you to configure it from either betaNums or finalNums. Default is betaNums.
	public var insertedText:Int;
    public var insertedX:Int;
	public var insertedY:Int;
	public var insertedScale:Float;
	public var insertedSpacing:Int;

	public var insertedAlign:FlxTextAlign = FlxTextAlign.LEFT;

	var BetaNum:FlxBitmapText;

	var daLetters:String = "0123456789";

     public function new(numberType:String, insertedText:Int, insertedX:Int, insertedY:Int, insertedScale:Float, insertedSpacing:Int, insertedAlign:FlxTextAlign) {
        super();

        if (numberType != "betaNums" || numberType != "finalNums"){ // Note, it's possible to add more types of numbers by adding the image and a thing for it here.
        // For those smarter saying that I could've just detected if it was null/invalid, I say that the line was getting too long.
			numberType = "betaNums";
        }


		var fontConfigXNA = FlxBitmapFont.fromXNA("assets/images/b3313HUD/font/numbers/" + numberType + "-XNA.png", daLetters);

        BetaNum = new FlxBitmapText(fontConfigXNA);

        //textTryA = new FlxBitmapText(fontXNA);
		text = '$insertedText';

		useTextColor = false;
		autoSize = true;
		multiLine = true;
		//alignment = FlxTextAlign.LEFT;
		lineSpacing = 1;
		letterSpacing = insertedSpacing;

		font = fontConfigXNA;

		antialiasing = false;

		x = insertedX;
		y = insertedY;
		//add(b3313Num);


		var insSpace2String:String = "" + insertedSpacing;


		fontConfigXNA.spaceWidth = 16;



        updateHitbox();
    }
}
