//
//  MainScene.h
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

//Start with an empty grid. You can tap on a cell in the grid to place a creature. After you're done adding creatures to the grid, you can start the simulation. The simulation runs in steps, or generations. every generation, the amount of alive neighbors every cell has is counted.If a creature has 0-1 live neighbors, the Creature on that cell dies or stays dead. If it has 2-3 live neighbors, it stays alive. If it has 4 or more, it stays dead or dies. If it has exactly 3 neighbors and it is dead, it comes to life!

#import "CCNode.h"

@interface MainScene : CCNode

@end
