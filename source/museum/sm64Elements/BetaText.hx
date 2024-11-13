package museum.sm64Elements;

import flixel.text.FlxText;
import flixel.text.FlxBitmapText;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.text.FlxText;
import flixel.text.FlxText.FlxTextAlign;
import Math;

class BetaText extends FlxBitmapText {
    public var one:String;
    public var two:String;

    /*public var text:String;
    public var x:Int;
	public var y:Int;
	public var scale:Float;*/

	public var insertedText:String;
    public var insertedX:Int;
	public var insertedY:Int;
	public var insertedScale:Float;
	public var insertedSpacing:Int;

	public var insertedAlign:FlxTextAlign = FlxTextAlign.LEFT;

	var BetaText:FlxBitmapText;

	var daLetters:String = "0123456789" + "ABCDEFGHIJKLMNOPRSTUWYZ"; // Contains some extra letters not seen in 0.2 of B3313 and some letters aren't seen there. Temporary.


    /*public function new(one:String, two:String) {
        super();
        this.one = one;
        this.two = two;
        trace(one + two);
    }*/

     public function new(insertedText:String, insertedX:Int, insertedY:Int, insertedScale:Float, insertedSpacing:Int, insertedAlign:FlxTextAlign) {
        super();
        /*this.text = insertedText;
        this.x = insertedX;
        this.y = insertedY;
        this.scale = insertedScale;*/
        //trace('Text: $insertedText, X + Y: ($insertedX ,  $insertedY), Scale:  $insertedScale');
		var fontConfigXNA = FlxBitmapFont.fromXNA("assets/images/b3313HUD/font/betaLetters-0.2-XNA.png", daLetters);

        BetaText = new FlxBitmapText(fontConfigXNA);

        //textTryA = new FlxBitmapText(fontXNA);
		text = insertedText;

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
		//add(BetaText);


		var insSpace2String:String = "" + insertedSpacing;


		fontConfigXNA.spaceWidth = 16;








		//fontConfigXNA.spaceWidth = Math.pow(Math.abs( Std.parseFloat(insSpace2String) ), 2); // Makes the width the absolute value of the spacing to the second power.
		// In simpler terms, the spacing width is the spacing of the letters, except how far it is from zero, and multiplied by itself once.
		// If you had a letterSpacing of -4, then you'd get 16. How? Well, it's math.
		// pow(value, power) in HF takes the first value and multiplies it by the power of the second one. The second one is how many times it gets multiplied.
		// The first value we have set is the absolute value of the letter spacing. The absolute value, or abs (in coding) is the technical distance of a number from zero. So for instance, -27 would have an abs of 27, 35 would be the same, so on.
		// So if the letter spacing was -4, then the abs would be normal 4.
		// Put 4 to the 2nd power. (4^2, or 4 * 4), then you get 16.


        updateHitbox();
    }
}


/*
class BetaText extends FlxBitmapText
{
    var BetaText:FlxBitmapText;
	var daLetters:String = "0123456789" + "ABCDEFGHIJKLMNOPRSTUWXYZ"; // Contains some extra letters not seen in 0.2 of B3313 and some letters aren't seen there. Temporary.


	var insertedText:String = "(Placeholder Text)";
	var insertedSize:Float;
	var insertedX:Float;
	var insertedY:Float;




	//override public function new(one:String, two:String)
	override public function new(text:String, x:Int, y:Int, scale:Float)
	{
	// new THING [actually a betatext]
	// text, x, y, scale, and alignment
	// "text", 1, 1, 1.0, LEFT/RIGHT/CENTER/JUSTIFY
	// nvm no alignment

		var fontXNA = FlxBitmapFont.fromXNA("assets/images/b3313HUD/font/betaLetters-0.2-XNA.png", daLetters);
		BetaText = new FlxBitmapText(fontXNA);




	}

}*/
