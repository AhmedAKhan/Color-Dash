package  {
	
	import flash.events.Event;
	import flash.display.MovieClip;
	import newYourClass;
	import flash.display.Sprite;
	import fl.motion.Color;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Landscapes extends MovieClip{
		
		//private var landscapes:Array; // as above
		private var buildings:Array;
		private var x_pos:uint = 0;
		private var backgrounds:Array; // could be a Vector.<Class> if above CS3
		private var buildingGenorator;
		private var speed:Number = 3;
		public var speedTimer:Timer;
			
		private var startGame:Boolean = false;
			
		public function Landscapes() {
			buildingGenorator = new newYourClass();
			
			// Populate the lists with your classes here.
			backgrounds = new Array();
			
			// backgrounds.push(LinearSky);
			backgrounds.push(StarrySky);
			backgrounds.push(CloudySky);
			
			//generates the scene
			generate();
						
			buildings = new Array();
			
			stage.addEventListener(Event.ENTER_FRAME, moveBuildings);
			
			for(var i:int = 0; 600 > x_pos; i++){
				buildings[i] = generateBuilding(i);
				addChild(buildings[i]);
			}
		}

		// Destroy the existing scene and build a new one
		function generate() {
			// remove all children
			while (numChildren>0) removeChildAt(0);
			// add a random class from each list
			addChild(new backgrounds[int(Math.random()*backgrounds.length)](stage.stageWidth, stage.stageHeight));
			
			// add a lens blur
			addChild(new Bokeh(stage.stageWidth, stage.stageHeight));
			// tint the whole thing
			
			var color:Color = new Color();
			color.setTint(0xFFFFFF*Math.random(),0.2);
			transform.colorTransform=color;
		}

		function moveBuildings(e:Event){
			x_pos -= speed//1;//the width of all the buildings combined
			
			//MovieClip(this.parent).gotoAndPlay("mainMenu");
			if(MovieClip(this.parent).currentLabel == "game" && startGame == false){
				speed = 1;
				speedTimer = new Timer(5000, 15);
				speedTimer.addEventListener(TimerEvent.TIMER, increaseBackgroundSpeed);
				speedTimer.start();
				startGame = true;
			}else if(MovieClip(this.parent).currentLabel != "game"){
				if(MovieClip(this.parent).currentLabel == "menu"){
					speed = 3;
				}else if(MovieClip(this.parent).currentLabel == "gameOver" && startGame == true){
					startGame = false;
					speedTimer.stop();
					speedTimer.removeEventListener(TimerEvent.TIMER, increaseBackgroundSpeed);
					speed = 2;
				}
			}
			
			if(MovieClip(this.parent).currentLabel == "mainMenu"){
				generate();
				
				x_pos = 0;
				
				for(i = 0; 600 > x_pos; i++){
					buildings[i] = generateBuilding(i);
					addChild(buildings[i]);
				}
				MovieClip(this.parent).gotoAndStop("menu");
			}
			
			for(var i = 0; i < buildings.length; i++){
				buildings[i].x -= speed;

				if(buildings[i].x < 0 - buildings[i].width){
					
					if(buildings[i].parent == this){
						removeChild(buildings[i]);
						buildings[i] = generateBuilding(i);
						
						addChild(buildings[i]);
						while(x_pos < 600){
							buildings[buildings.length] = generateBuilding(buildings.length);
							addChild(buildings[buildings.length-1]);
						}
					}
				}
			}
		}
		
		private function increaseBackgroundSpeed(te:TimerEvent){
			speed += 0.5;
		}
		
		private function generateBuilding(i:int):Object{
			var h:uint  = Math.random() * 140 + 100 ;
			var Width:uint = Math.random()*20 +20 

			buildings[i] = buildingGenorator.generateMovieClip(0, 0, Width, h);
			buildings[i].x = x_pos;
			x_pos += Width;
			buildings[i].y = 400- h;
			return buildings[i];
		}
	}
	
}
