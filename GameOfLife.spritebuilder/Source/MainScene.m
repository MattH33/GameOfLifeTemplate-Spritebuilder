//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "Grid.h"

@implementation MainScene {
    Grid *_grid;
    CCTimer *_timer;
    CCLabelTTF *_generationLabel;
    CCLabelTTF *_populationLabel;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        _timer = [[CCTimer alloc] init];
    }
    
    return self;
}

//this tells the game to call the method called 'step' every half second.
- (void)play
{
    [self schedule:@selector(step) interval:0.5f];
}

//this tells the game to call a stop the method called 'step' when the pause button is tapped.
- (void)pause
{
    [self unschedule:@selector(step)];
}

// this method will get called every half second when you hit the play button and will stop getting called when you hit the pause button. update the stats and gamestate (generation, alive/dead creatures)
- (void)step
{
    [_grid evolveStep];
    _generationLabel.string = [NSString stringWithFormat:@"%d", _grid.generation];
    _populationLabel.string = [NSString stringWithFormat:@"%d", _grid.totalAlive];
}

@end