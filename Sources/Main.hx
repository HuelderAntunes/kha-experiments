package;

import js.html.Window;
import kha.graphics4.Graphics2.ColoredShaderPainter;
import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import Experiment;
import experiments.ExperimentOne;

class Main {
	public static function main() {
		System.start({title: "kha-experiments", width: 1024, height: 768}, function (_) {
			Assets.loadEverything(function () {

				var experiment : Experiment = new ExperimentOne();

				Scheduler.addTimeTask(function () { experiment.update(); }, 0, 1 / 60);
				System.notifyOnFrames(function (frames) { experiment.render(frames); });
			});
		});
	}
}
