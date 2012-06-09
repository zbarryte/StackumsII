package
{
	import org.flixel.*;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	
	public class PlayState extends FlxState
	{
		[Embed(source="assets/floor.png")] private var ImgFloor:Class;
		
		private var floor:FlxTileblock;
		protected var player:Player;
		protected var currentBlock:Block;
		private var blocks:FlxGroup = new FlxGroup();
		private var allBlocks:FlxGroup = new FlxGroup();
		
		override public function create():void
		{	
			floor = new FlxTileblock(0, FlxG.height, 224, 4);
			floor.loadGraphic(ImgFloor);
			add(floor);
			
			player = new Player();
			add(player);
			player.allBlocks = allBlocks;
			
			// this is dumb, clean it up with some generator later
			// meh
			currentBlock = new Block(FlxG.width/2 + 4,FlxG.height - 4);
			add(currentBlock);
			blocks.add(currentBlock);
			allBlocks.add(currentBlock);
			currentBlock.allBlocks = allBlocks;
			
			currentBlock = new Block(FlxG.width/2 + 4,FlxG.height - 8);
			add(currentBlock);
			blocks.add(currentBlock);
			allBlocks.add(currentBlock);
			currentBlock.allBlocks = allBlocks;
			
			currentBlock = new Block(FlxG.width/2 -  8,FlxG.height - 8);
			add(currentBlock);
			blocks.add(currentBlock);
			allBlocks.add(currentBlock);
			currentBlock.allBlocks = allBlocks;
		}
		
		override public function update():void
		{
			if (FlxG.keys.X)
			{
				var block:Block;
				var i:String;
				if (player.facingLeft())
				{
					for (i in blocks.members)
					{
						block = blocks.members[i];
						if (block.x == player.x - 4 && block.y <= player.y + 4)
						{
							player.blocks.add(block);
						}
					}
				}
				if (player.facingRight())
				{
					for (i in blocks.members)
					{
						block = blocks.members[i];
						if (block.x == player.x + 4 && block.y <= player.y + 4)
						{
							player.blocks.add(block);
						}
					}
				}
			}
			else
			{
				player.blocks.clear();
			}
			
			super.update();
			FlxG.collide();
		}
	}
}