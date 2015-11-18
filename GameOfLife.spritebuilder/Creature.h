//
//  Creature.h
//  GameOfLife
//
//  Created by Matt H on 2015-11-11.
//  Copyright © 2015 Apportable. All rights reserved.
//

//The game starts with an empty grid. You can tap on a cell in the grid to place a creature. After you're done adding creatures to the grid, you can start the simulation. The simulation runs in steps, or generations. Every generation, the amount of alive neighbors that every cell has is counted. If a creature has 0-1 live neighbors, the creature in that cell dies or stays dead. If it has 2-3 live neighbors, it stays alive. If it has 4 or more live neighbors, it stays dead or dies. If it has exactly 3 live neighbors and it is dead, it comes to life.

#import "CCSprite.h"

@interface Creature : CCSprite

//Stores the current state of the creature.
@property (nonatomic, assign) BOOL isAlive;

//Stores the amount of living neighbors.
@property (nonatomic, assign) NSInteger livingNeighbors;

//Will setup the creature with an image.
- (id)initCreature;

@end