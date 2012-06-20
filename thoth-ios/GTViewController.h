//
//  GTViewController.h
//  thoth-ios
//
//  Created by Chris Westin on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GTCardView.h"

@class GTCard;


@interface GTViewController : UIViewController
{
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
   Get the opponent's first card view

   @returns the opponent's first card view
*/
- (GTCardView *)ocv1;

/**
   Get the opponent's second card view

   @returns the opponent's second card view
*/
- (GTCardView *)ocv2;

/**
   Get the opponent's third card view

   @returns the opponent's third card view
*/
- (GTCardView *)ocv3;

/**
   Get the player's first card view

   @returns the player's first card view
*/
- (GTCardView *)pcv1;

/**
   Get the player's second card view

   @returns the player's second card view
*/
- (GTCardView *)pcv2;

/**
   Get the player's third card view

   @returns the player's third card view
*/
- (GTCardView *)pcv3;

@end
