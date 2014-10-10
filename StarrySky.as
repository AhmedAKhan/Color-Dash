package {
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	public class StarrySky extends LinearSky {
		
		public static const BASE = 10; // The 'size' of the noisy bits
		public static const OCTS = 4; // The number of layers of noise
		
		public function StarrySky(w:uint, h:uint) {
			// Draw the linear sky
			super(w,h);
			// Make the bitmap data for the stars
			var stars:BitmapData = new BitmapData(w,h);
			// Draw perlin noise onto the stars bitmap data
			stars.perlinNoise(BASE, BASE, OCTS, Math.random()*1000, true, true, 1, true);
			// Delete all but the whitest pixels
			stars.threshold(stars, 						// the pixels to check
							new Rectangle(0,0,w,h), 	// the area to check
							new Point(),				// The position of the Rectangle
							"<",						// The operator to check with
							0xDDDDDD,					// The threshold value
							0,							// The colour to replace them with
							0xFFFFFF,					// The mask colour (all in this case)
							true);						// Copy original pixels if failed?
			// Make the bitmap object to display the stars
			var starsBitmap:Bitmap = new Bitmap(stars);
			addChild(starsBitmap);
			// Add a moon
			var moon:Moon = new Moon(h/4+Math.random()*h/2);
			// Random x position. Subtract half the width to centre it
			moon.x = Math.random()*w - moon.width/2;
			// Random y position. No lower than halfway down the screen
			moon.y = Math.random()*h/2 - moon.height/2;
			addChild(moon);
		}
	}
}