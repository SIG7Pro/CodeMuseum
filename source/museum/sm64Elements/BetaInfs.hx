package museum.sm64Elements;
// Very stripped down BetaNum.hx.
import flixel.FlxSprite;

class BetaInfs extends FlxSprite {
    /*Note: the numbers lack minus signs, but most people won't really need those anyway.*/
	public var neededElement:String = "betaCross";
    public var insertedX:Int;
	public var insertedY:Int;
	public var insertedScale:Float;
	var BetaInfs:FlxSprite;

     public function new(neededElement:String, insertedX:Int, insertedY:Int, insertedScale:Float) {
        super();

        /*
        List of elements:
        betaCross
        betaApostrophe
        betaCrossSSK
        betaQuote
        finalApostrophe
        finalCross
        finalQuote
        M (negative numbers)

        */

        if (neededElement == "-"){
			neededElement = "M";
        }

		loadGraphic("assets/images/b3313HUD/font/informals/" + neededElement + ".png");

        BetaInfs = new FlxSprite();
		antialiasing = false;
		x = insertedX;
		y = insertedY;
        updateHitbox();
    }
}
