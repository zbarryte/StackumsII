package
{
	import flash.utils.Dictionary;
	
	import org.flixel.*;
	
	public class Block extends FlxSprite
	{
		[Embed(source="assets/green.png")] private var ImgBlock:Class;
		private var counter:Number = 0;
		public var allBlocks:FlxGroup = new FlxGroup();
		
		public function Block(X:Number=0, Y:Number=0)
		{
			super(X, Y, ImgBlock);
			immovable = true;
		}
		
		override public function update():void
		{			
			counter += FlxG.elapsed;
			if (counter >= 0.5)
			{
				counter = 0;
				if (!overlapsAt(x, y + frameHeight,allBlocks))
				{
					y += frameHeight;
				}
			}
			kludgeUpdate();
		}
		public function kludgeUpdate():void
		{
			if (x < 0)
				x = 0;
			if (x > FlxG.width - 4)
				x = FlxG.width - 4;
			if (y > FlxG.height -4)
				y = FlxG.height - 4;
		}
	}
}