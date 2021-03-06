package com.anttikupila.revolt.presets {
	import com.anttikupila.revolt.presets.Preset;
	import com.anttikupila.revolt.drawers.*;
	import com.anttikupila.revolt.effects.*;
	import com.anttikupila.revolt.scalers.*;
	import flash.display.BitmapData;
	
	public class Explosion extends Preset {
		function Explosion() {
			super();
			fourier = true;
			drawers = new Array(new Exploder());
			effects = new Array(new Blur(3,3), new Perlin(5,3), new Blur(10,6), new Tint(0xff0000, 0.1));
			scalers = new Array(new ZoomIn());
		}
		
		public function toString():String {
			return "Circular explosion";
		}
	}
}