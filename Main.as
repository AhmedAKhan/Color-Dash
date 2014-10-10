package {
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import fl.motion.Color;
	
	public class Main extends Sprite {
		
		// References to background and landscape classes.
		// 1 of each will be randomly selected when a scene is made.
		private var backgrounds:Array; // could be a Vector.<Class> if above CS3
		private var landscapes:Array; // as above
		
		public function Main() {
			// Populate the lists with your classes here.
			backgrounds = new Array();
			landscapes = new Array();
			// Comment out one of the pushes if you want to disable that class
			// backgrounds.push(LinearSky);
			backgrounds.push(StarrySky);
			backgrounds.push(CloudySky);
			landscapes.push(YourClass);
			// add a click listener to the stage to generate the scene
			stage.addEventListener(MouseEvent.CLICK, generate); 
		}
		
		// Destroy the existing scene and build a new one
		private function generate(m:MouseEvent) {
			// remove all children
			while (numChildren>0) removeChildAt(0);
			// add a random class from each list
			addChild(new backgrounds[int(Math.random()*backgrounds.length)](stage.stageWidth, stage.stageHeight));
			addChild(new landscapes[int(Math.random()*landscapes.length)](stage.stageWidth, stage.stageHeight));
			// add a lens blur
			addChild(new Bokeh(stage.stageWidth, stage.stageHeight));
			// tint the whole thing
			
			var color:Color = new Color();
			color.setTint(0xFFFFFF*Math.random(),0.2);
			transform.colorTransform=color;
		}
	}
}