//
//  Creature.m
//  GameOfLife
//
//  Created by Matt H on 2015-11-11.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "Creature.h"

@implementation Creature

//Gives the creature an image and sets their default not-alive state.
- (instancetype)initCreature {

    self = [super initWithImageNamed:@"GameOfLifeAssets/Assets/bubble.png"];
    
    if (self) {
        self.isAlive = NO;
    }
    
    return self;
}

//When the creature is not-alive, it's invisible, and becomes visible when it's alive.
- (void)setIsAlive:(BOOL)newState {

    _isAlive = newState;
    self.visible = _isAlive;
}

@end
