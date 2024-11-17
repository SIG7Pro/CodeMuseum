package museum.sm64Elements;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;

import flixel.text.FlxBitmapText;
import flixel.graphics.frames.FlxBitmapFont;

/*

References:
https://haxeflixel.com/demos/FlxBitmapText/
https://api.haxeflixel.com/flixel/graphics/frames/FlxBitmapFont.html
https://api.haxeflixel.com/flixel/text/FlxBitmapText.html
https://github.com/HaxeFlixel/flixel-demos/blob/dev/UserInterface/FlxBitmapText/source/PlayState.hx

Special Thanks:
https://github.com/mariosbignuts/Soulles-DX-YCE/blob/main/scripts/sonicHud.hx
https://neeeoo.github.io/funkin-packer/
https://www.photopea.com
https://raw.githubusercontent.com/HaxeFlixel/flixel-demos/refs/heads/dev/UserInterface/FlxBitmapText/assets/fontData10pt.png

To-Dos:
- Add widescreen detection. (In the sense the HUD shifts when in widescreen.)
- Add scaling support. (As in the text gets bigger if the screen is a multiple of the OG screen size.)
- Test out overlaps. (Mostly for numbers and "YOU ARE NOT WORTHY" stuff.)

*/

class B3313Huds extends FlxState
{
    var healthPie:FlxSprite;
    var textTryA:FlxBitmapText;
    /*var healthPie:FlxSprite;
    var healthPie:FlxSprite;
    var healthPie:FlxSprite;*/

    //var tex = getSparrowAtlas("b3313HUD/font/betaLetters-0.2-background");

    /*var frormbeie02Letters:String = "0123456789"
			+ "A'BC*DEFGHIJKLMNOP"
			+ '."'
			+ "RSTUWXYZ"; // Contains some extra letters not seen in 0.2 of B3313 and some letters aren't seen there. Temporary.*/

	var beie02Letters:String = "0123456789" + "ABCDEFGHIJKLMNOPRSTUWXYZ"; // Contains some extra letters not seen in 0.2 of B3313 and some letters aren't seen there. Temporary.



	override public function create()
	{
		var fontXNA = FlxBitmapFont.fromXNA("assets/images/b3313HUD/font/betaLetters-0.2-XNA.png", beie02Letters);

        /*var text = new FlxBitmapText(FlxBitmapFont.fromMonospace((Paths.image("b3313HUD/font/betaLetters-0.2-background.png"), FlxBitmapFont.DEFAULT_CHARS, FlxPoint.get(8, 8)));
		text.text = "Hello, World!";
		text.scale.set(2, 2);
		text.screenCenter();
		text.lineSpacing = -1;
		add(text);*/


		textTryA = new FlxBitmapText(fontXNA);
		textTryA.text = "ABCDEFGHIJKLMNOPRSTUWXYZ\n1234567890";
		trace(textTryA.text);
		textTryA.useTextColor = false;
		textTryA.autoSize = false;
		textTryA.multiLine = true;
		textTryA.alignment = FlxTextAlign.LEFT;
		textTryA.lineSpacing = 5;
		textTryA.padding = 5;
		textTryA.x = 150;
		textTryA.y = 15;
		add(textTryA);




	}

	function healthMove()
	{
	// Determines if the health goes up when the player is at full health* or if it should go down, say the player is hurt.
	// *Note, I have no reason for this, but there's triggers for touching poison and for touching water. These would disable it from going up normally.

	}


	/*inline static public function getSparrowAtlas(key:String, ?library:String)
	{
		return FlxAtlasFrames.fromSparrow(image(key, library), file('images/$key.xml', library)); // https://github.com/FunkinCrew/Funkin/blob/legacy/0.2.x/source/Paths.hx
	}*/


}
