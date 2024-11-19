package museum.sm64Elements;
// Built off of BetaInfs.hx, in which it basically is a very stripped down BetaNum.hx.
import flixel.FlxSprite;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;

class HealthMeter extends FlxSprite {
    /*Note: the numbers lack minus signs, but most people won't really need those anyway.*/
	public var meterType:String = "broll1";
    public var insertedX:Int;
	public var insertedY:Int;
    public var hideX:Int;
	public var hideY:Int;
	public var insertedScale:Float;
	var HealthMeter:FlxSprite;


     public function new(meterType:String, insertedX:Int, insertedY:Int, hideX:Int, hideY:Int, insertedScale:Float) {
     // Note: hideX and hideY are where the health meter goes when the player is at full health.
        super();


        if (meterType == null){
			meterType = "broll1";
        }

		loadGraphic("assets/images/b3313HUD/healthPies/" + meterType + ".png");

		var animationData = FlxAtlasFrames.fromSparrow("assets/images/b3313HUD/healthPies/" + meterType + ".png", "assets/images/b3313HUD/healthPies/" + meterType + ".xml");

        HealthMeter = new FlxSprite();
		antialiasing = false;
		x = insertedX;
		y = insertedY;
        updateHitbox();

        frames = animationData;
		//animation.addByPrefix('itemFocus', menulowercase + 'Selected');
 		//animation.addByPrefix('itemDeselect', menulowercase + 'Unselected');


        animation.addByPrefix('0', "0");
        animation.addByPrefix('1', "1");
        animation.addByPrefix('2', "2");
        animation.addByPrefix('3', "3");
        animation.addByPrefix('4', "4");
        animation.addByPrefix('5', "5");
        animation.addByPrefix('6', "6");
        animation.addByPrefix('7', "7");
        animation.addByPrefix('8', "8");
        animation.addByPrefix('Full', "8");
        animation.addByPrefix('Empty', "0");

       // add(menuPlay);
    }

    function hideTo(){
    // Makes the health meter go away.


    }
}
