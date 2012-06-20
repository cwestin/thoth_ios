//
//  GTHand.h
//  thoth-ios
//
//  Created by Chris Westin on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GTScore.h"

@interface GTHand : NSObject
{
    NSMutableArray *pHand;
    GTScore *pScore;
}


/**
   Add a card to this hand.

   Hands are assumed not to be more than three cards.

   @param pCard the card to add
   @returns true if the card was added, false otherwise (because this would
     result in the hand having more than three cards)
*/
- (bool) addCard:(GTCard *)pCard;

@end
