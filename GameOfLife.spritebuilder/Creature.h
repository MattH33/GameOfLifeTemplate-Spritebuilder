//
//  Creature.h
//  GameOfLife
//
//  Created by Matt H on 2015-11-11.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Creature : CCSprite

// stores the current state of the creature
@property (nonatomic, assign) BOOL isAlive;

// stores the amount of living neighbors
@property (nonatomic, assign) NSInteger livingNeighbors;

// will setup the creature with an image
- (id)initCreature;

@end