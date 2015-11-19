//
//  MainScene.m
//  GameOfLife
//
//  Created by Matt H on 2015-11-11.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "Grid.h"

@implementation MainScene {
    
    //Connects the Spritebuilder objects to code.
    Grid *_grid;
    CCTimer *_timer;
    CCLabelTTF *_generationLabel;
    CCLabelTTF *_populationLabel;
}

//Initializes the timer.
- (id)init
{
    self = [super init];
    
    if (self) {
        _timer = [[CCTimer alloc] init];
    }
    
    return self;
}

//Starts the method 'step' when the play button is tapped.
- (void)play
{
    [self schedule:@selector(step) interval:0.5f];
}

//Stops the method 'step' when the pause button is tapped.
- (void)pause
{
    [self unschedule:@selector(step)];
}

//This method will get called every half second when you hit the play button and will stop getting called when you hit the pause button. It will update what the current generation is and how many alive creatures there are.
- (void)step
{
    [_grid evolveStep];
    _generationLabel.string = [NSString stringWithFormat:@"%d", _grid.generation];
    _populationLabel.string = [NSString stringWithFormat:@"%d", _grid.totalAlive];
}

@end