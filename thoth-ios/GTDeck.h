//
//  GTDeck.h
//  thoth-ios
//
//  Created by Chris Westin on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GTCard.h"


@interface GTDeck : NSObject
{
    NSMutableArray *pA;
    int nextCard;
}

// overrides from NSObject
- (id)init;


/**
 Shuffle the deck
 
 On subsequent calls to deal, this will yield a new random sequence of cards.
 */
- (void)shuffle;


/**
 Deal a randomly chosen card.
 
 @returns the randomly chosen card, or nil if there are none left
 */
- (GTCard *)deal;

@end
