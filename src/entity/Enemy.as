package entity {
	import org.axgl.Ax;
	import org.axgl.AxVector;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Enemy extends Entity {
		
		private var _myColor:uint = GC.WHITE;
		
		public function Enemy(x:Number, y:Number, color:uint) {
			super(x, y, Asset.GFX_PINROSE, 34, 34);
			velocity = new AxVector(0, 30, 360);
			_myColor = color;
			show(_myColor);
			solid = false;
		}
		
		public function get myColor():uint {
			return _myColor;
		}
		
		override public function update():void {
			if (y > Ax.height) {
				destroy();
			}
			
			super.update();
		}
	}
}