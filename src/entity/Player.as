package entity {
	import entity.Bullet.BulletPlayer;
	import entity.Entity;
	import org.axgl.Ax;
	import org.axgl.AxGroup;
	import org.axgl.AxPoint;
	import org.axgl.AxRect;
	import org.axgl.AxSprite;
	import org.axgl.AxU;
	import org.axgl.AxVector;
	import org.axgl.input.AxKey;
	import org.axgl.input.AxMouseButton;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Player extends Entity {
		
		private var _myColor:uint = GC.WHITE;
		private var gOffset:AxPoint;
		
		private static const FIRE_DELAY:Number = 0.1;
		private var fire:Number = 0;
		
		public function Player(x:Number, y:Number) {
			Registry.player = this;		
			super(x, y, Asset.GFX_PLAYER, 48, 31);
			gOffset = new AxPoint(width / 2 - 1, height / 2);
			x -= gOffset.x;
			y -= gOffset.y;
			worldBounds = new AxRect(0, 0, Ax.width, Ax.height);
			slow = 0;
			maxVelocity.x = maxVelocity.y = 400;
		}
		
		override public function update():void {
			followMouse();
			
			if (Ax.keys.pressed(AxKey.Z)) myColor = int(!myColor);
			if (Ax.mouse.down(AxMouseButton.LEFT) && fire <= 0) {
				shoot(Registry.game.bulletsPlayer);
				fire = FIRE_DELAY;
			}
			
			fire -= Ax.dt;
			
			super.update();
		}
		
		private function followMouse():void {
			var theOffset:AxPoint = new AxPoint(x + gOffset.x, y + gOffset.y);
			if (AxU.distanceToMouse(theOffset.x, theOffset.y) > maxVelocity.x * Ax.dt) {
				var angle:Number = AxU.getAngleToMouse(theOffset.x, theOffset.y);
				velocity.x = maxVelocity.x * Math.cos(angle);
				velocity.y = maxVelocity.y * Math.sin(angle);
			} else {
				velocity.x = velocity.y = 0;
				var m:AxPoint = new AxPoint(Ax.mouse.x, Ax.mouse.y);
				if (m.x >= gOffset.x &&
					m.y >= gOffset.y &&
					m.x <= Ax.width - gOffset.x &&
					m.y <= Ax.height - gOffset.y) {
					x = m.x - gOffset.x;
					y = m.y - gOffset.y;
				}
			}
		}
		
		private function shoot(group:AxGroup):Bullet {
			var bullet:Bullet = new BulletPlayer(myColor, x + gOffset.x, y + gOffset.y);
			group.add(bullet);
			return bullet;
		}
		
		private function get myColor():uint {
			return _myColor;
		}
		
		private function set myColor(value:uint):void {
			_myColor = value;
			show(value);
		}
	}
}