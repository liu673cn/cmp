package com.anttikupila.revolt.presets {
	import flash.display.BitmapData;
	
	public class Preset {
		private var _fourier:Boolean = true;
		private var _scalers:Array;
		private var _effects:Array;
		private var _drawers:Array;
		
		function Preset() {
			_scalers = new Array();
			_effects = new Array();
			_drawers = new Array();
		}
		
		public function set fourier(newFourier:Boolean):void {
			_fourier = newFourier;
		}
		
		public function get fourier():Boolean {
			return _fourier;
		}
		
		public function init():void {
			// to be overridden
		}
		
		public function applyGfx(gfx:BitmapData, soundArray:Array):void {
			for (var i in _scalers) {
				_scalers[i].applyScale(gfx);
			}
			for (var j in _effects) {
				_effects[j].applyFX(gfx);
			}
			for (var k in _drawers) {
				_drawers[k].drawGFX(gfx, soundArray);
			}
		}
		
		//
		
		public function set drawers(newDrawers:Array):void {
			_drawers = newDrawers;
		}
		
		public function set effects(newEffects:Array):void {
			_effects = newEffects;
		}
		
		public function set scalers(newScalers:Array):void {
			_scalers = newScalers;
		}
	}
}