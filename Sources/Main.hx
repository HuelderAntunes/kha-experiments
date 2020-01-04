package;

import js.html.Window;
import kha.graphics4.Graphics2.ColoredShaderPainter;
import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.graphics2.Graphics;
import kha.Color;
import kha.Display;

class Main {
	private static var started : Bool = false;
	private static var frameHeight : Float = 0;
	private static var rectY : Float = 0.0;
	private static var speedScalar : Float = 0.1;

	static function update(): Void {
		rectY = (frameHeight/2-50) +Math.sin(speedScalar)*frameHeight/4;
		speedScalar += 0.01;
	}

	static function render(frames: Array<Framebuffer>): Void {
		if(!started) return;

		for (frame in frames) {

			frameHeight = frame.height;
			var g : Graphics = frame.g2;
			g.begin();
			g.clear(Color.Green);
			g.color = Color.Blue;
			g.fillRect(frame.width/2-250, rectY, 500, 100);
			g.end();
			
		}
		
	}

	public static function main() {
		System.start({title: "kha-experiments", width: 1024, height: 768}, function (_) {
			Assets.loadEverything(function () {
				started = true;
				Scheduler.addTimeTask(function () { update(); }, 0, 1 / 60);
				System.notifyOnFrames(function (frames) { render(frames); });
			});
		});
	}
}
