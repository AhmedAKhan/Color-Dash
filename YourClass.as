package  {
	
	import flash.display.Sprite;
	
	public class YourClass extends Sprite {

		public const author = "Your name";
		public const title = "Scene name";

		public function YourClass(w:uint, h:uint) {
			// Make your scene! Feel free to delete everything below this point
			
			// Here's a very simple example:
			while (width<w*2) {
				// Fill the screen with dark grey rectangles
				graphics.beginFill(0x444444);
				graphics.drawRect(width,h,20+Math.random()*10,-(h/4+Math.random()*h/3));
				graphics.endFill();
			}
		}
	}
}