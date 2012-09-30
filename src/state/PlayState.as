package state {
	
	import display.Linefield;
	import display.MouseAxis;
	import entity.Bullet;
	import entity.Enemy;
	import entity.EnemySpawn;
	import entity.Player;
	import org.axgl.Ax;
	import org.axgl.AxEntity;
	import org.axgl.AxGroup;
	import org.axgl.AxState;
	import org.axgl.collision.AxCollisionGroup;
	import org.axgl.collision.AxGrid;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class PlayState extends AxState {
		
		private static var PLAYER_ENEMY_COLLIDER:AxCollisionGroup;
		private static var ENEMY_BULLET_COLLIDER:AxCollisionGroup;
		
		public var bulletsPlayer:AxGroup = new AxGroup;
		public var enemies:AxGroup = new AxGroup;
		public var player:AxEntity;
		
		private static const GARBAGE_COLLECT_DELAY:Number = 5;
		private var garbageCollectTimer:Number = GARBAGE_COLLECT_DELAY;
		
		public function PlayState() {
			Registry.game = this;
			
			add(new Linefield(Asset.GFX_BG1, 1200, 0.3));
			add(new Linefield(Asset.GFX_BG2, 900, 0.2));
			add(new Linefield(Asset.GFX_BG3, 600, 0.05));		
			add(new MouseAxis(0.3));
			add(new EnemySpawn(enemies));
			
			add(bulletsPlayer);
			add(enemies);
			player = add(new Player(160, 570) as AxEntity);
			
			PLAYER_ENEMY_COLLIDER = new AxGrid(Ax.width, Ax.height);
			ENEMY_BULLET_COLLIDER = new AxGrid(Ax.width, Ax.height);
		}
		
		override public function update():void {
			Ax.overlap(player, enemies, onPlayerEnemyHit, PLAYER_ENEMY_COLLIDER);
			Ax.overlap(enemies, bulletsPlayer, onEnemyBulletHit, ENEMY_BULLET_COLLIDER);
			
			garbageCollectTimer -= Ax.dt;
			if (garbageCollectTimer <= 0) {
				garbageCollectTimer = GARBAGE_COLLECT_DELAY;
				garbageCollect();
			}

			super.update();
		}
		
		private function garbageCollect():void {
			for each (var member:AxEntity in members) {
				try {
					var m:AxGroup = member as AxGroup;
					m.cleanup();
				} catch (e:Error) {}
			}
		}
		
		private function onPlayerEnemyHit(player:AxEntity, enemy:AxEntity):void {
			if (player is Player) player.destroy();
		}
		
		private function onEnemyBulletHit(enemy:AxEntity, bullet:AxEntity):void {
			var e:Enemy = enemy as Enemy, b:Bullet = bullet as Bullet;
			if (e.myColor != b.myColor) {
				e.destroy();
			}
			b.destroy();
		}
	}
}