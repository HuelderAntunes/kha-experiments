package experiments;

import kha.Framebuffer;
import Experiment;
import kha.Color;
import kha.Display;
import kha.graphics2.Graphics;

class ExperimentOne implements Experiment {
	private var frameHeight : Float = 0;
	private var rectY : Float = 0.0;
	private var speedScalar : Float = 0.1;

	public function new() : Void {};

	public function update(): Void {
		rectY = (frameHeight/2-50) +Math.sin(speedScalar)*frameHeight/4;
		speedScalar += 0.01;
	}

	public function render(frames: Array<Framebuffer>): Void {
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
}