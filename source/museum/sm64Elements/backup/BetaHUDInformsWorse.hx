package museum.sm64Elements;

import flixel.text.FlxText;
import flixel.text.FlxBitmapText;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.text.FlxText;
import flixel.text.FlxText.FlxTextAlign;
import Math;

class BetaHUDInforms extends FlxBitmapText {
    public var one:String;
    public var two:String;

	public var infType:String = "betaType"; // In B3313, there's a chance you get a beta styled hud (Shinshokai, the B-Roll huds) and there's a chance to get a pre-final hud (Like the Demo 1995, E3 huds). This allows you to configure it from either betaNums or finalNums. Default is betaNums.
	public var insertedText:String; // Reason this is a string was since I had issues setting this as an int. Oops I wrote these changes to the wrong files.
    public var insertedX:Int;
	public var insertedY:Int;
	public var insertedScale:Float;
	public var insertedSpacing:Int;

	public var insertedAlign:FlxTextAlign = FlxTextAlign.LEFT;

	var BetaHUDInforms:FlxBitmapText;

	var daLetters:String;

     public function new(infType:String, insertedText:String, insertedX:Int, insertedY:Int, insertedScale:Float, insertedSpacing:Int, insertedAlign:FlxTextAlign) {
        super();



        /*if (infType == "betaType"){ // Works the same as the numbers, except it's handled on one image.
			daLetters == '*"' + "'"; // This registers as [*"']
        }
        if (infType == "finType"){
			daLetters == 'XXX*"' + "'"; // This registers as [XXX*"']
			// Reason why XXX is used at the start is so that *, ", and ' can be recognized as the ones pushed lower.
			// So basically, the first type would use the first 3 slots as *"', and then the last 3 as undefined/null.
			// However, this would use the first 3 slots as X, and then use the last 3 slots for what's needed.
			// In a nutshell, the XXX is used to push what's needed to the end.
        }
        if (infType == "sskType"){
			daLetters == 'XXXX"' + "'*"; // Reason this is like this is due to the SSK cross being at the end.
        } // It wasn't letting me do elseifs and quite frankly I don't wanna pull up a switch statement.*/

        daLetters == "1234567"; // The above method I was going to use didn't work, sorry.
        // In a nutshell:
        /*
        1 - Final Game Cross
        2 - Final Game Quotation Mark
        3 - Final Game Apostrophe

        4 - Beta Cross
        5 - Beta Quotation Mark
        6 - Beta Apostrophe

        7 - Beta Cross (Shinshokai)

        */

        if (infType != "betaType" || infType != "finType" || infType != "sskType"){ // Works the same as the numbers, except it's handled on one image.
			infType == "betaType";
        }


		var fontConfigXNA = FlxBitmapFont.fromXNA("assets/images/b3313HUD/font/informals-XNA.png", daLetters);

        BetaHUDInforms = new FlxBitmapText(fontConfigXNA);

		text = insertedText;
		useTextColor = false;
		autoSize = true;
		multiLine = true;
		lineSpacing = 1;
		letterSpacing = insertedSpacing;

		font = fontConfigXNA;

		antialiasing = false;

		x = insertedX;
		y = insertedY;
		fontConfigXNA.spaceWidth = 16;

        updateHitbox();
    }
}
