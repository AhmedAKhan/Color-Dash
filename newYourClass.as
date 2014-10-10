package  {
	
	import flash.display.Sprite;
	import flash.display.MovieClip;
	
	public class newYourClass extends MovieClip {

		public const author = "Your name";
		public const title = "Scene name";

		public function newYourClass() {
			
		}
		
		public function generateMovieClip(x_pos:int, y_pos:int, w:uint, h:uint):MovieClip{
			var mc:MovieClip=new MovieClip();//createMovieClip(0,0,100,100);
			mc.graphics.beginFill(0x444444);
			//mc.graphics.drawRect(width,h,20+Math.random()*10,-(h/4+Math.random()*h/3));
			mc.graphics.drawRect(x_pos, y_pos, w, h);
			mc.graphics.endFill();
			//addChild(mc);
			return mc;
		}
	}
}