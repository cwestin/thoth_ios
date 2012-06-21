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

- (void)setupModelsAndPScore:(int)pScore andOScore:(int)oScore
{
    // the model data for the game
    pDeck = [[GTDeck alloc] init];
    pOpponentHand = [[GTHand alloc] init];
    pPlayerHand = [[GTHand alloc] init];

    opponentScore = oScore;
    playerScore = pScore;
}

- (void)showScores
{
    [self setOpponentScore:opponentScore];
    [self setPlayerScore:playerScore];
}

- (void)dealHand
{
    pDealView.hidden = NO;
    pOutcomeView.hidden = YES;

    [pDeck shuffle];

    GTCard *pCard;

    // deal player and opponent cards
    pCard = [pDeck deal];
    [pPlayerHand addCard:pCard];
    [pPCV1 setCard:pCard];
    [pPCV1 setFaceUp:true];
    NSLog(@"GTViewController set pcv1");

    pCard = [pDeck deal];
    [pOpponentHand addCard:pCard];
    [pOCV1 setCard:pCard];
    [pOCV1 setFaceUp:true];
    NSLog(@"GTViewController set ocv1");

    pCard = [pDeck deal];
    [pPlayerHand addCard:pCard];
    [pPCV2 setCard:pCard];
    [pPCV2 setFaceUp:true];
    NSLog(@"GTViewController set pcv2");

    pCard = [pDeck deal];
    [pOpponentHand addCard:pCard];
    [pOCV2 setCard:pCard];
    [pOCV2 setFaceUp:false];
    NSLog(@"GTViewController set ocv2");

    [pPCV3 setCard:nil];


    // deal the table cards to choose from
    pCard = [pDeck deal];
    [pDCB1 setCard:pCard];
    [pDCB1 setFaceUp:true];
    NSLog(@"GTViewController set dcb1");

    pCard = [pDeck deal];
    [pDCB2 setCard:pCard];
    [pDCB2 setFaceUp:true];
    NSLog(@"GTViewController set dcb2");

    pCard = [pDeck deal];
    [pDCB3 setCard:pCard];
    [pDCB3 setFaceUp:true];
    NSLog(@"GTViewController set dcb3");
}

- (IBAction)choose:(id)sender
{
    // add the chosen card to the player's hand
    GTCard *pCard = [sender card];
    NSLog(@"choose %@", pCard);
    [pPlayerHand addCard:pCard];
    [pPCV3 setCard:pCard];
    [pPCV3 setFaceUp:true];

    // remove the card from the remaining choices
    [sender setCard:nil];

    // expose the opponent's hidden card
    [pOCV2 setFaceUp:true];

    // evaluate opponent's best choice, and set result
    pOutcomeText.text = [NSString stringWithFormat:@"no hand evaluation yet"];
    
    // switch to showing the results
    pDealView.hidden = YES;
    pOutcomeView.hidden = NO;

}

- (IBAction)yield:(id)sender
{
    NSLog(@"choose yield");

    playerScore -= 9;
    [self setPlayerScore:playerScore];

    [self dealHand];
}

- (IBAction)deal:(id)sender
{
    [self dealHand];
}

@end
