package entity {
	
	import com.greensock.TweenMax;
	import org.axgl.Ax;
	import org.axgl.AxEntity;
	import org.axgl.AxGroup;
	import org.axgl.AxPoint;
	import org.axgl.AxSprite;
	import org.axgl.AxU;
	import org.axgl.AxVector;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Bullet extends Entity {		
		
		protected var _myColor:uint = GC.WHITE;
		protected var gOffset:AxPoint;
		
		public function Bullet(x:Number, y:Number, a:Number = 270) {
			super(x - gOffset.x, y - gOffset.y);
			var radAngle:Number = a * (Math.PI / 180);
			asvMultiplier = 50;
			slow = 0;
			velocity = new AxVector(Math.cos(radAngle) * maxVelocity.x, Math.sin(radAngle) * maxVelocity.y);
		}
		
		override public function update():void {
			if (right < 0 ||
				left > Ax.width ||
				bottom < 0 ||
				top > Ax.height) destroy();
			
			super.update();
		}
		
		public function get myColor():uint {
			return _myColor;
		}
	}
}