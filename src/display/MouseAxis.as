package display {
	
	import com.greensock.TweenMax;
	import flash.display.BitmapData;
	import org.axgl.Ax;
	import org.axgl.AxGroup;
	import org.axgl.AxPoint;
	import org.axgl.AxSprite;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class MouseAxis extends AxGroup {
		
		private var AxisX:AxSprite;
		private var AxisY:AxSprite;
		private var current:AxPoint = new AxPoint;
		private var mainAlpha:Number;
		private var idle:Number = 1;
		private var idleTimer:Number = idle;
		
		public function MouseAxis(alpha:Number) {
			var graphicX:BitmapData = new BitmapData(Ax.width, 1, false, 0x0);
			var graphicY:BitmapData = new BitmapData(1, Ax.height, false, 0x0);
			AxisX = new AxSprite(0, Ax.mouse.y);
			AxisY = new AxSprite(Ax.mouse.x, 0);
			AxisX.load(graphicX);
			AxisY.load(graphicY);
			
			this.add(AxisX).add(AxisY);
			myAlpha = mainAlpha = alpha;
		}
		
		override public function update():void {
			AxisX.y = Ax.mouse.y;
			AxisY.x = Ax.mouse.x;
			idleAlpha();
			
			super.update();
		}
		
		private function idleAlpha():void {
			var m:AxPoint = new AxPoint(Ax.mouse.x, Ax.mouse.y), c:AxPoint = current;
			if (c.x != m.x || c.y != m.y) {
				TweenMax.to(this, 1, { myAlpha:mainAlpha} );
				idleTimer = idle;
			} else {
				idleTimer -= Ax.dt;
				if (idleTimer <= 0) {
					TweenMax.to(this, 1, { myAlpha:0 } );
				}
			}
			current.x = Ax.mouse.x;
			current.y = Ax.mouse.y;
		}
		
		public function get myAlpha():Number {
			return AxisX.alpha;
		}
		
		public function set myAlpha(value:Number):void {
			AxisX.alpha = value;
			AxisY.alpha = value;
		}
	}
}