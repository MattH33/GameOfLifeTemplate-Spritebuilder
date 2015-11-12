//
//  Grid.h
//  GameOfLife
//
//  Created by Matt H on 2015-11-11.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Grid : CCSprite

// will be used to store the current game stats that will be displayed in the game.
@property (nonatomic, assign) int totalAlive;
@property (nonatomic, assign) int generation;

- (void)evolveStep;
- (void)countNeighbors;
- (void)updateCreatures;

@end
