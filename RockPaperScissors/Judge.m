//
//  Judge.m
//  RockPaperScissors
//
//  Created by MacBook Pro on 9/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "Judge.h"
#import "ComputerHand.h"

@implementation Judge

- (BOOL)didComputerWin:(ComputerHand *)compootersWeapon orWeapon:(NSString *)weapon2
{
    NSString *weapon = compootersWeapon.computerHand;
    
    if ([weapon isEqualToString:@"paper"] && [weapon2 isEqualToString:@"rock"]) return YES;
    else if ([weapon isEqualToString:@"rock"] && [weapon2 isEqualToString:@"scissors"]) return YES;
    else if ([weapon isEqualToString:@"scissors"] && [weapon2 isEqualToString:@"paper"]) return YES;
    else return NO;
}

@end
