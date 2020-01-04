import kha.Framebuffer;

interface Experiment {
	public function update() : Void;
	public function render(frames: Array<Framebuffer>) : Void;
}