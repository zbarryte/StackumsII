package
{		
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source="assets/you.png")] private var ImgPlayer:Class;
		public var counter:Number = 0;
		public var blocks:FlxGroup = new FlxGroup();
		public var allBlocks:FlxGroup = new FlxGroup();
		
		public function Player()
		{
			super(FlxG.width/2, FlxG.height - 8);
			loadGraphic(ImgPlayer,false,true);
			facing = RIGHT;
			acceleration.y = 222;
			
		}
		public function facingLeft():Boolean
		{
			return facing == LEFT;
		}
		public function facingRight():Boolean
		{
			return facing == RIGHT;
		}
		
		override public function update():void
		{	
			counter += FlxG.elapsed;
			if (counter >= 0.11)
			{
				counter = 0;
				var block:Block;
				var i:String;
				if (FlxG.keys.LEFT && x - frameWidth >= 0)
				{
					x -= frameWidth;
					if (blocks.members.length > 0)
					{
						for (i in blocks.members)
						{
							block = blocks.members[i];
							if (!block.overlapsAt(block.x - frameWidth,block.y,allBlocks))
								{
									block.x -= frameWidth;
								}
						}
					}
					else
					{
						facing = LEFT;
					}
				}				
				if (FlxG.keys.RIGHT && x + frameWidth <= FlxG.width - frameWidth)
				{
					x += frameWidth;
					if (blocks.members.length > 0)
					{
						for (i in blocks.members)
						{
							block = blocks.members[i];
							block.x += frameWidth;
						}
					}
					else
					{
						facing = RIGHT;
					}
					
				}
			}
			
			if (isTouching(FLOOR))
			{
				if (FlxG.keys.justPressed("SPACE"))
				{
					velocity.y = -acceleration.y*0.222;
				}
			}
		}
	}
}