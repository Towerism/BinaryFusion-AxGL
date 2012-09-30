package {
	
	import flash.ui.Mouse;
	import org.axgl.Ax;
	import state.PlayState;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	
	[SWF(frameRate = "60", width = "320", height = "640")]
	public class Main extends Ax {
		
		public function Main() {
			super(PlayState);
			Ax.debug = true;
			Ax.dispose = true;
			
			Mouse.hide();
		}		
	}
}