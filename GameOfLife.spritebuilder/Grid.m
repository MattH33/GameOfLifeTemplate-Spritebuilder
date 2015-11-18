//
//  Grid.m
//  GameOfLife
//
//  Created by Matt H on 2015-11-11.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

//These are variables that cannot be changed, and set the amount of rows and columns of the grid.
static const int GRID_ROWS = 8;
static const int GRID_COLUMNS = 10;

@implementation Grid {
    
    //Stores all the creatures in the grid.
    NSMutableArray *_gridArray;
    
    //Variables that will be used to place the creatures on the grid correctly.
    float _cellWidth;
    float _cellHeight;
    }

//Calls the setupGrid method and activates touch interaction.
- (void)onEnter
{
    [super onEnter];
    [self setupGrid];
    self.userInteractionEnabled = YES;
}

- (void)setupGrid
{
    //Divides the grid's size by the number of columns/rows to figure out the correct width and height of each cell.
    _cellWidth = self.contentSize.width / GRID_COLUMNS;
    _cellHeight = self.contentSize.height / GRID_ROWS;
    
    float x = 0;
    float y = 0;
    
    //Initializes the array as a blank NSMutableArray.
    _gridArray = [NSMutableArray array];
    
    //Initializes and places Creatures by iterating through each row/column cell.
    for (int i = 0; i < GRID_ROWS; i++) {
        
        _gridArray[i] = [NSMutableArray array];
        x = 0;
        
        for (int j = 0; j < GRID_COLUMNS; j++) {
            Creature *creature = [[Creature alloc] initCreature];
            creature.anchorPoint = ccp(0, 0);
            creature.position = ccp(x, y);
            [self addChild:creature];
            
            _gridArray[i][j] = creature;
            
            x+=_cellWidth;
        }
        
        y += _cellHeight;
    }
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    //Gets the x,y coordinates of a touch.
    CGPoint touchLocation = [touch locationInNode:self];
    
    //Gets the Creature at that location.
    Creature *creature = [self creatureForTouchPosition:touchLocation];
    
    //Invert its state - kill it if it's alive, bring it to life if it's dead.
    creature.isAlive = !creature.isAlive;
}

//Gets the row and column that was touched and returns the Creature inside the corresponding cell.
- (Creature *)creatureForTouchPosition:(CGPoint)touchPosition
{
    int row = touchPosition.y / _cellHeight;
    int column = touchPosition.x / _cellWidth;
    
    return _gridArray[row][column];
}

//Checks if a given cell is off-screen or not.
- (BOOL)isIndexValidForX:(int)x andY:(int)y
{
    BOOL isIndexValid = YES;
    if(x < 0 || y < 0 || x >= GRID_ROWS || y >= GRID_COLUMNS)
    {
        isIndexValid = NO;
    }
    return isIndexValid;
}

- (void)countNeighbors{
    
    //Iterates through the rows.
    for (int i = 0; i < [_gridArray count]; i++)
    {
        //Iterates through all the columns for a given row.
        for (int j = 0; j < [_gridArray[i] count]; j++)
        {
            //Access the creature in the cell that corresponds to the current row/column.
            Creature *currentCreature = _gridArray[i][j];
            currentCreature.livingNeighbors = 0;
            
            //Examines every cell around the current one.
            for (int x = (i-1); x <= (i+1); x++)
            {
                for (int y = (j-1); y <= (j+1); y++)
                {
                    //Checks that the cell isn't off the screen.
                    BOOL isIndexValid;
                    isIndexValid = [self isIndexValidForX:x andY:y];
                    
                    //Skips over all cells that are off screen and the cell that contains the creature that is currently being checked. Then updates the livingNeighbors property for the current creature.
                    if (!((x == i) && (y == j)) && isIndexValid)
                    {
                        Creature *neighbor = _gridArray[x][y];
                        if (neighbor.isAlive)
                        {
                            currentCreature.livingNeighbors += 1;
                        }
                    }
                }
            }
        }
    }
}

- (void)updateCreatures{
    
    //Stores the total number of current creatures that are alive.
    _totalAlive = 0;
    
    //Iterates through the rows.
    for (int i = 0; i < [_gridArray count]; i++) {
        
        //Iterates through all the columns for a given row.
        for (int j = 0; j < [_gridArray[i] count]; j++) {
            
            //Access the creature in the cell that corresponds to the current row/column.
            Creature *currentCreature = _gridArray[i][j];
            
            //Checks if the Creature's livingNeighbors property is set to 3.
            if (currentCreature.livingNeighbors == 3) {
                
                // If it is, set the isAlive property to YES.
                currentCreature.isAlive = YES;
                
            //Checks if the Creature has less than or equal to 1 living neighbor or more than or equal to 4.
            } else if ( (currentCreature.livingNeighbors <= 1) || (currentCreature.livingNeighbors >= 4)) {
                //If either are true, set the Creature's isAlive property to NO.
                currentCreature.isAlive = NO;
            }
            //If a creature is alive, increase the totalAlive property.
            if (currentCreature.isAlive) {
                    _totalAlive++;
            }
        }
    }
}

- (void)evolveStep {
    //Updates each Creature's neighbor count.
    [self countNeighbors];
    
    //Updates each Creature's state.
    [self updateCreatures];
    
    //Updates the generation so the label's text will display the correct generation.
    _generation++;
}

@end