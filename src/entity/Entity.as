package entity {
	
	import org.axgl.Ax;
	import org.axgl.AxSprite;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Entity extends AxSprite {
		
		private var _asvMultiplier:Number = 0;
		private var _accel:Number = 0;
		private var _slow:Number = 0;
		private var _speed:Number = 0;
		
		public function Entity(x:Number, y:Number, graphic:Class=null, frameWidth:uint=0, frameHeight:uint=0) {
			super(x, y, graphic, frameWidth, frameHeight);
			drag.x = _slow;
			drag.y = _slow;
		}
		
		override public function destroy():void {
			if (Ax.dispose) disposeSelf = true;
			
			super.destroy();
		}
		
		public function get asvMultiplier():Number {
			return _asvMultiplier;
		}
		
		public function set asvMultiplier(value:Number):void {
			_asvMultiplier = value;
			accel = GC.BASE_ACCEL * value;
			slow = GC.BASE_SLOW * value;
			speed = GC.BASE_SPEED * value;
		}
		
		public function get accel():Number {
			return _accel;
		}
		
		public function set accel(value:Number):void {
			_accel = value;
		}
		
		public function get slow():Number {
			return _slow;
		}
		
		public function set slow(value:Number):void {
			_slow = value;
			drag.x = drag.y = value
		}
		
		public function get speed():Number {
			return _speed;
		}
		
		public function set speed(value:Number):void {
			_speed = value;
			maxVelocity.x = maxVelocity.y = value;
		}
	}
}