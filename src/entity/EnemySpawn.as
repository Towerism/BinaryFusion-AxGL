package entity {
	
	import org.axgl.Ax;
	import org.axgl.AxEntity;
	import org.axgl.AxGroup;
	import org.axgl.AxU;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class EnemySpawn extends AxEntity {
		
		private static const SPAWN_CHANCE_PERSEC:int = 150;
		private static const ROOM_PADDING:Number = 20;
		
		private var enemyGroup:AxGroup;
		
		public function EnemySpawn(group:AxGroup) {
			super(x, y);
			enemyGroup = group;
		}
		
		override public function update():void {
			if (AxU.rand(0, 100) < SPAWN_CHANCE_PERSEC * Ax.dt) {
				enemyGroup.add(new Enemy(AxU.randf(0 + ROOM_PADDING, Ax.width - ROOM_PADDING), -50, AxU.rand(0, 1)));
			}
			
			super.update();
		}
	}
}