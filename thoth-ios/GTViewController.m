//
//  GTViewController.m
//  thoth-ios
//
//  Created by Chris Westin on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GTViewController.h"

#import "GTCardView.h"

@implementation GTViewController

// override from UIViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"GTViewController viewDidLoad %@", self);
    NSLog(@"opponentLabel is %@", pOpponentScore);
    NSLog(@"opponentLabel text is %@", pOpponentScore.text);
}

// override from UIViewController
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

// override from UIViewController
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)setOpponentScore:(int)score
{
    NSString *pS = [NSString stringWithFormat:@"Opponent: %d", score];
    NSLog(@"opponentLabel is %@", pOpponentScore);
    NSLog(@"opponentLabel text is %@", pOpponentScore.text);
    pOpponentScore.text = pS;
    NSLog(@"Set opponent score to %d", score);
}

- (void)setPlayerScore:(int)score
{
    NSString *pS = [NSString stringWithFormat:@"You: %d", score];
    pPlayerScore.text = pS;
    NSLog(@"Set player score to %d", score);
}

- (GTCardView *)ocv1
{
    return pOCV1;
}

- (GTCardView *)ocv2
{
    return pOCV2;
}

- (GTCardView *)ocv3
{
    return pOCV3;
}

- (GTCardView *)pcv1
{
    return pPCV1;
}

- (GTCardView *)pcv2
{
    return pPCV2;
}

- (GTCardView *)pcv3
{
    return pPCV3;
}

- (GTCardButton *)pdcb1
{
    return pDCB1;
}

- (IBAction)chooseDC1:(id)sender
{
    NSLog(@"chooseDC1");
}

@end
