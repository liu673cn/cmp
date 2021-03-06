package com.anttikupila.revolt.drawers {
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import com.anttikupila.revolt.drawers.Line;
	
	public class SmoothLine extends Line {
		private var lineSprite:Sprite;
		private var z:Number = 0;
		
		function SmoothLine() {
			super();
			lineSprite = new Sprite();
		}
		
		override public function drawGFX(gfx:BitmapData, soundArray:Array):void {
			var l:uint = soundArray.length;
			lineSprite.graphics.clear();
			lineSprite.graphics.moveTo(-2, gfx.height/2);
			for (var i:uint = 0; i < l; i+=4) {
				var a:uint = i;
				var color = 0xbb9029;
				if (i >= (l/2)) {
					a -= l/2;
					color = 0xffffff;
				}
				lineSprite.graphics.lineStyle(1, color);
				var xPos = (a/(l/2))*(gfx.width+10);
				var yPos = -soundArray[i]*gfx.height/4 + Math.cos(z)*(gfx.height/8);
				if (i >= l/2) yPos *= -1;
				
				if (i == l/2) {
					lineSprite.graphics.moveTo(0, yPos + gfx.height/2);
				}
//				trace(i + " (" + a +") - " + xPos);
				lineSprite.graphics.lineTo(xPos, yPos + gfx.height/2);
			}
			gfx.draw(lineSprite, null, null, "add");
			z += 0.01;
		}
		
		override public function init():void {
			fourier = (Math.round(Math.random()*2) == 1) ? true : false;
		}
	}
}