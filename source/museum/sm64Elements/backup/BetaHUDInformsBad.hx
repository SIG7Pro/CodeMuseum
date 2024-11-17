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

	public var infType:String = "betaType";
	public var symbolType:Int;
    public var insertedX:Int;
	public var insertedY:Int;
	public var insertedScale:Float;
	public var insertedSpacing:Int;

	public var insertedAlign:FlxTextAlign = FlxTextAlign.LEFT;

	var BetaHUDInforms:FlxBitmapText;

	var daLetters:String;

	// Built off BetaNum.hx since the old version wasn't working.
	// insertedText has been replaced with symbolType.

	// The types:
        /*
        1 - Final Game Cross
        2 - Final Game Quotation Mark
        3 - Final Game Apostrophe

        4 - Beta Cross
        5 - Beta Quotation Mark
        6 - Beta Apostrophe

        7 - Beta Cross (Shinshokai)

        */

     public function new(symbolType:Int, insertedX:Int, insertedY:Int, insertedScale:Float, insertedSpacing:Int, insertedAlign:FlxTextAlign) {
        super();

        configStuff();
        /*

        */

        tripTrop();

		useTextColor = false;
		autoSize = true;
		multiLine = true;
		lineSpacing = 1;
		letterSpacing = insertedSpacing;

		antialiasing = false;
		x = insertedX;
		y = insertedY;




    }

    public function tripTrop(){
		var fontConfigXNA = FlxBitmapFont.fromXNA("assets/images/b3313HUD/font/informals-XNA.png", daLetters);
		BetaHUDInforms = new FlxBitmapText(fontConfigXNA);
		font = fontConfigXNA;
		fontConfigXNA.spaceWidth = 16;
		//tripTrop();
		 updateHitbox();
    }

    public function configStuff(){

    switch symbolType{
			// yes
				case 1:daLetters = "AXXXXXXX";
				case 2:daLetters = "XAXXXXXX";
				case 3:daLetters = "XXAXXXXX";
				case 4:daLetters = "XXXXXXXX";
				case 5:daLetters = "XXXXAXXX";
				case 6:daLetters = "XXXXXAXX";
				case 7:daLetters = "XXXXXXAX";
				case 8:daLetters = "XXXXXXXA"; // idk why I added an 8th value
				//case null:symbolType = 1;


			text = 'A'; // Logic: Different symbolTypes would turn the symbol in the slot to turn into an A with the rest Os.
			// So slot 5 would have the stuff be loaded as XXXXAXXX on informals-XNA.png.
			// This likely isn't very convinient for those smarter than I, but if it works, it works.

			}

    }

}
