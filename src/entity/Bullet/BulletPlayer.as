package entity.Bullet {
	
	import entity.Bullet;
	import org.axgl.AxPoint;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class BulletPlayer extends Bullet {
		
		public function BulletPlayer(color:uint, x:Number, y:Number, a:Number = 270) {
			gOffset = new AxPoint(2, 13);
			super(x, y, a);
			load(Asset.GFX_BULLET, 6, 15);
			_myColor = color;
			show(_myColor);
		}
	}
}