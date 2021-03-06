package com.anttikupila.revolt.drawers {
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import com.anttikupila.revolt.drawers.Drawer;
	
	public class Line extends Drawer {
		private var lineSprite:Sprite;
		function Line() {
			super();
			fourier = true;
			lineSprite = new Sprite();
		}
		
		override public function drawGFX(gfx:BitmapData, soundArray:Array):void {
			lineSprite.graphics.clear();
			lineSprite.graphics.moveTo(0, gfx.height/2);
//			lineSprite.graphics.beginFill(0x336600);
			for (var i:uint = 0; i < soundArray.length; i+=2) {
				var a:uint = i;
				if (i >= soundArray.length/2) a -= soundArray.length/2;
				if (i == soundArray.length/2) lineSprite.graphics.moveTo(0, gfx.height/2);
				lineSprite.graphics.lineStyle(1, 0x00ffff*a);
				var xPos:Number = (a/(soundArray.length))*(gfx.width*4+2);
				var yPos:Number = -soundArray[i]*gfx.height/4;
				xPos -= 2; // to prevent black line to the left
				if (i >= soundArray.length/2) yPos *= -1;
				lineSprite.graphics.lineTo(xPos, yPos + gfx.height/2);
			}
			lineSprite.graphics.endFill();
			gfx.draw(lineSprite);
		}
	}
}