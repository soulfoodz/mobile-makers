//
//  ViewController.m
//  RockPaperScissors
//
//  Created by Don Bora on 4/24/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "Judge.h"
#import "ComputerHand.h"

@interface ViewController ()
{
    NSTimer *               timer;
    int                     count;
    ComputerHand *          compWeapon;
    

    __weak IBOutlet UILabel *countDownLabel;
    __weak IBOutlet UILabel *computerHandLabel;
    __weak IBOutlet UILabel *playerHandLabel;
}


- (IBAction)start:(id)sender;
- (IBAction)rock:(id)sender;
- (IBAction)paper:(id)sender;
- (IBAction)scissors:(id)sender;
- (void)disableButtons:(BOOL)state;

@property (weak, nonatomic) IBOutlet UIButton *rockButton;
@property (weak, nonatomic) IBOutlet UIButton *paperButton;
@property (weak, nonatomic) IBOutlet UIButton *scissorButton;


@end


@implementation ViewController

-(void)showWinner
{
    NSString *playerWeapon;
    Judge    *judge;
    
    playerWeapon = playerHandLabel.text;
    
    judge = [[Judge alloc] init];
    
    BOOL computerWon = [judge didComputerWin:compWeapon
                                    orWeapon:playerWeapon];
        
    if (computerWon) {
        computerHandLabel.backgroundColor = [UIColor greenColor];
    }
    else{
        playerHandLabel.backgroundColor = [UIColor greenColor];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    // choices = @[@"rock", @"paper", @"scissors"];
    count = 3;
    [self updateCount];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateCount
{
    countDownLabel.text = [NSString stringWithFormat:@"%i", count];
}


-(void)countDown
{
    count--;
    [self updateCount];
    
    if (count == 0)
        {
        [timer invalidate];
        count = 4;
        
        computerHandLabel.text = compWeapon.computerHand;
        
        //computerHandLabel.text = [choices objectAtIndex:arc4random() % 3];
        [self showWinner];
        [self disableButtons:YES];
        }
}


- (IBAction)start:(id)sender
{
    compWeapon = nil;
    [self disableButtons:NO];
    
    compWeapon = [[ComputerHand alloc] init];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(countDown)
                                           userInfo:nil
                                            repeats:YES];
    
    playerHandLabel.backgroundColor = [UIColor whiteColor];
    
    computerHandLabel.backgroundColor = [UIColor whiteColor];
    computerHandLabel.text = nil;
    playerHandLabel.text = nil;
}

- (IBAction)rock:(id)sender
{
    playerHandLabel.text = @"rock";
    
    //[self showWinner];
}

- (IBAction)paper:(id)sender
{
    playerHandLabel.text = @"paper";
    
    //[self showWinner];
}

- (IBAction)scissors:(id)sender
{
    playerHandLabel.text = @"scissors";
    
    //[self showWinner];
}


- (void)disableButtons:(BOOL)state
{
    if (state == YES)
        {
        self.rockButton.enabled = NO;
        self.paperButton.enabled = NO;
        self.scissorButton.enabled = NO;
        }
    else
        {
        self.rockButton.enabled = YES;
        self.paperButton.enabled = YES;
        self.scissorButton.enabled = YES;
        }
}



@end
