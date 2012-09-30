package {
	
	import org.axgl.AxPreloader;
	
	public class Preloader extends AxPreloader {
		// uncomment if you want to use image 
		//[Embed(source="../assets/LOADER.jpg")] protected var ImgLoaderScreen:Class;
		
		//loading bar will be placed bottom of your swf and over the image
		//loading bar height: 39px

		[SWF(backgroundColor="#FFFFFF")]
		public function Preloader()
		{
			super();
			
			// uncomment if you are using the image 
			//loaderScreen = new ImgLoaderScreen();

			className = "Main";
			minDisplayTime = 2;
			
		}
	}
}