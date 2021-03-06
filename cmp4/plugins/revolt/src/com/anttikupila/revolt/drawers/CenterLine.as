package com.anttikupila.revolt.drawers {
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import com.anttikupila.revolt.drawers.Drawer;
	
	public class CenterLine extends Drawer {
		private var lineSprite:Sprite;
		private var z:Number = 0;
		private var yOffset:Number = 50;
		
		function CenterLine() {
			super();
			fourier = true;
			lineSprite = new Sprite();
		}
		
		override public function drawGFX(gfx:BitmapData, soundArray:Array):void {
			lineSprite.graphics.clear();
			lineSprite.graphics.moveTo(gfx.width/2, gfx.height/2 + yOffset);
			lineSprite.graphics.lineStyle(2, 0x990000);
			lineSprite.graphics.lineTo(gfx.width/2-soundArray[0]*gfx.width/4, gfx.height/2 + yOffset);
			lineSprite.graphics.moveTo(gfx.width/2, gfx.height/2 + yOffset);
			lineSprite.graphics.lineStyle(2, 0x009900);			
			lineSprite.graphics.lineTo(gfx.width/2+soundArray[soundArray.length/2]*gfx.width/4, gfx.height/2 + yOffset);
			var rot:Number = (Math.sin(z)*20) / 180 * Math.PI; // -10 - 10 deg & Deg > rad conversion
			var trans:Matrix = new Matrix();
			trans.rotate(rot);
			trans.translate(0, -Math.sin(rot*2)*gfx.height/2 - Math.pow(Math.sin(z*5),2)*10);
			gfx.draw(lineSprite, trans, null, "screen");
			z += 0.02;
		}
	}
}