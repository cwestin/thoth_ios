//
//  GTScore.h
//  thoth-ios
//
//  Created by Chris Westin on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GTCard.h"

@interface GTScore : NSObject
{
    int handType; // 1, 2, or 3 for a single card, pair, or triplet
    int handKind; // the kind of the type (e.g., HIGH, ROYAL, COUNCIL, etc)
    int handScore;
    GTCard *pHighest; // highest ranking card in the set
}

/**
   Score a hand

   @param pCards the array of GTCards
   @returns a score object
*/
+ (GTScore *)score:(NSMutableArray *)pCards;

@end
