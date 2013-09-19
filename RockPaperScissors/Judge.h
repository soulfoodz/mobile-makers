//
//  Judge.h
//  RockPaperScissors
//
//  Created by MacBook Pro on 9/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ComputerHand;

@interface Judge : NSObject

- (BOOL)didComputerWin:(ComputerHand *)compootersWeapon orWeapon:(NSString *)weapon2;

@end
