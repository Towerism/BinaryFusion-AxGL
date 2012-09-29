package {
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Asset {
		[Embed(source = "../assets/level/background1.png")] public static const GFX_BG1:Class;
		[Embed(source = "../assets/level/background2.png")] public static const GFX_BG2:Class;
		[Embed(source = "../assets/level/background3.png")] public static const GFX_BG3:Class;
		
		[Embed(source = "../assets/player/ship.png")] public static const GFX_PLAYER:Class;
		[Embed(source = "../assets/enemy/PinRose.png")] public static const GFX_PINROSE:Class;
		
		[Embed(source = "../assets/projectile/bullet.png")] public static const GFX_BULLET:Class;
	}
}