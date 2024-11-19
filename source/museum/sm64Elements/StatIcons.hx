package museum.sm64Elements;
// Built off of BetaInfs.hx, in which it basically is a very stripped down BetaNum.hx.
import flixel.FlxSprite;

class StatIcons extends FlxSprite {
    /*Note: the numbers lack minus signs, but most people won't really need those anyway.*/
	public var iconTitle:String = "betaCross";
    public var insertedX:Int;
	public var insertedY:Int;
	public var insertedScale:Float;
	var StatIcons:FlxSprite;

     public function new(iconTitle:String, insertedX:Int, insertedY:Int, insertedScale:Float) {
        super();

        /*
        List of icons:
        icon-mario.png
        icon-coin.png
        icon-star.png
        icon-luigi.png
        icon-star-alt.png

        Extras:
        icon-bf.png
        icon-bf-old.png (These huds were meant for an FNF Mod)

        */

        if (iconTitle == null){
			iconTitle = "unset";
        }

		loadGraphic("assets/images/b3313HUD/icons/icon-" + iconTitle + ".png");

        StatIcons = new FlxSprite();
		antialiasing = false;
		x = insertedX;
		y = insertedY;
        updateHitbox();
    }
}
