//
//  GTViewController.h
//  thoth-ios
//
//  Created by Chris Westin on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GTCardView.h"
#import "GTCardButton.h"
#import "GTDeck.h"
#import "GTHand.h"

@class GTCard;


@interface GTViewController : UIViewController
{
    GTDeck *pDeck;
    GTHand *pOpponentHand;
    GTHand *pPlayerHand;

    int opponentScore;
    int playerScore;

    IBOutlet UILabel *pOpponentScore;
    IBOutlet UILabel *pPlayerScore;

    // opponent's cards
    IBOutlet GTCardView *pOCV1;
    IBOutlet GTCardView *pOCV2;
    IBOutlet GTCardView *pOCV3;

    // player's cards
    IBOutlet GTCardView *pPCV1;
    IBOutlet GTCardView *pPCV2;
    IBOutlet GTCardView *pPCV3;

    IBOutlet UIView *pDealView;
    IBOutlet GTCardButton *pDCB1;
    IBOutlet GTCardButton *pDCB2;
    IBOutlet GTCardButton *pDCB3;

    IBOutlet UIView *pOutcomeView;
    IBOutlet UILabel *pOutcomeText;
    IBOutlet UIButton *pDealButton;
}

/**
   Set the opponent's score

   @param score the score
*/
- (void)setOpponentScore:(int)score;

/**
   Set the player's score

   @param score the score
*/
- (void)setPlayerScore:(int)score;

/**
   Set up the datamodels and both the player and opponent scores.

   @param playerScore the player score
   @param opponentScore the opponent's score
 */
- (void)setupModelsAndPScore:(int)playerScore andOScore:(int)opponentScore;

/**
   Do the initial score display
*/
- (void)showScores;

/**
   Deal a hand of Thoth. This basically starts a game, but does not reset
   the accumulated scores.
*/
- (void)dealHand;

/**
   Choose a card from the table to complete the player hand.

   All the card choice buttons set this up as a target.
   @param sender the card button chosen
 */
- (IBAction)choose:(id)sender;

/**
   Yield to the opponent (don't choose a card).

   @param sender the yield button
*/
- (IBAction)yield:(id)sender;

/**
   Deal a new hand.

   @param sender the deal button
*/
- (IBAction)deal:(id)sender;

@end
