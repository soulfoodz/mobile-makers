//
//  ComputerHand.m
//  RockPaperScissors
//
//  Created by MacBook Pro on 9/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ComputerHand.h"

@implementation ComputerHand

- (id)init 
{
    self = [super init];
    
    if (self)
    {
        NSArray *weapons = @[@"rock", @"paper", @"scissors"];
        self.computerHand = [weapons objectAtIndex:arc4random() % 3];
    }
    
    return self;
}

@end
