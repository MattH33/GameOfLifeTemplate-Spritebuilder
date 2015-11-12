//
//  Grid.m
//  GameOfLife
//
//  Created by Matt H on 2015-11-11.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

// these are variables that cannot be changed, and define the amount of rows and columns of the grid
static const int GRID_ROWS = 8;
static const int GRID_COLUMNS = 10;

@implementation Grid {
    
    // array that will store all the creatures in our grid.
    NSMutableArray *_gridArray;
    
    // will be used to place the creatures on our grid correctly in the method we will be implementing soon
    float _cellWidth;
    float _cellHeight;
    
    }

// calls the setupGrid method and activates touch interaction
- (void)onEnter
{
    [super onEnter];
    
    [self setupGrid];
    
    // accept touches on the grid
    self.userInteractionEnabled = YES;
}

// We set up two positioning variables x and y and initialize the array that will hold all the Creatures in our grid. Then we iterate through two nested loops and create an array for each row of the grid and fill each row with Creatures. After positioning a Creature we increase the x variable, after completing a row we increase the y variable.
- (void)setupGrid
{
    // divide the grid's size by the number of columns/rows to figure out the right width and height of each cell
    _cellWidth = self.contentSize.width / GRID_COLUMNS;
    _cellHeight = self.contentSize.height / GRID_ROWS;
    
    float x = 0;
    float y = 0;
    
    // initialize the array as a blank NSMutableArray
    _gridArray = [NSMutableArray array];
    
    // initialize Creatures
    for (int i = 0; i < GRID_ROWS; i++) {
        // this is how you create two dimensional arrays in Objective-C. You put arrays into arrays.
        _gridArray[i] = [NSMutableArray array];
        x = 0;
        
        for (int j = 0; j < GRID_COLUMNS; j++) {
            Creature *creature = [[Creature alloc] initCreature];
            creature.anchorPoint = ccp(0, 0);
            creature.position = ccp(x, y);
            [self addChild:creature];
            
            // this is shorthand to access an array inside an array
            _gridArray[i][j] = creature;
            
            // make creatures visible to test this method, remove this once we know we have filled the grid properly
            creature.isAlive = YES;
            
            x+=_cellWidth;
        }
        
        y += _cellHeight;
    }
}

@end