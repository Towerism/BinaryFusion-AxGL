package display {
	import org.axgl.AxGroup;
	import org.axgl.AxSprite;

	/**
	 * A scrolling starfield that repeats itself.
	 */
	public class Linefield extends AxGroup {
		
		private var topField:AxSprite;
		private var bottomField:AxSprite;

		public function Linefield(graphic:Class, speed:Number, alpha:Number=1) {
			super();

			bottomField = new AxSprite(0, 0, graphic);
			topField = new AxSprite(0, -bottomField.height, graphic);

			this.add(bottomField).add(topField);

			bottomField.velocity.y = topField.velocity.y = speed;
			bottomField.alpha = topField.alpha = alpha;
		}

		override public function update():void {
			if (topField.y >= 0) {
				topField.y -= topField.height;
				bottomField.y -= topField.height;
			}

			super.update();
		}
	}
}
