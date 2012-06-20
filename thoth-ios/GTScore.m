//
//  GTScore.m
//  thoth-ios
//
//  Created by Chris Westin on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GTScore.h"

#import "GTCard.h"

// private methods
@interface GTScore()

/**
   Return the highest kind in the argument

   @param kinds a set of bits found from oring together cards
   @returns the single highest kind bit
*/
+ (int)highestKind:(int)kinds;

/**
   Return the pair score for this kind of pairing.

   @param kind what kind of pair
   @returns the pair score for it
 */
+ (int)pairScore:(int)kind;

/**
   Score a pair

   @param pC1 first card
   @param pC2 second card
   @returns a GTScore, or nil if the cards don't form a pair
*/
+ (GTScore *)pairwiseEvaluate:pC1 with:pC2;

@end


@implementation GTScore

+ (GTScore *)score:(NSMutableArray *)pCards
{
    GTScore *pScore;

    // grab the cards
    GTCard *pC1 = [pCards objectAtIndex:0];
    GTCard *pC2 = [pCards objectAtIndex:1];
    GTCard *pC3 = [pCards objectAtIndex:2];

    int kind = [pC1 kind] & [pC2 kind] & [pC3 kind];
    if (kind)
    {
        pScore = [self alloc];

        // we have a triple; these always beat pairs
        pScore->handType = 3;
        pScore->handKind = [GTScore highestKind:kind];
        pScore->handScore = 72 + [GTScore pairScore:pScore->handKind];
            
        // find the highest card in the set (for tie-breaking)
        pScore->pHighest = pC1;
        if ([pC2 rank] > [pScore->pHighest rank])
            pScore->pHighest = pC2;
        if ([pC3 rank] > [pScore->pHighest rank])
            pScore->pHighest = pC3;

        return pScore;
    }

    // we have three possible pairs to check
    GTScore *pScore1 = [self pairwiseEvaluate:pC1 with:pC2];
    GTScore *pScore2 = [self pairwiseEvaluate:pC1 with:pC3];
    GTScore *pScore3 = [self pairwiseEvaluate:pC2 with:pC3];

    pScore = pScore1;
    if (!pScore || (pScore2 && (pScore2->handScore > pScore->handScore)))
        pScore = pScore2;
    if (!pScore || (pScore3 && (pScore3->handScore > pScore->handScore)))
        pScore = pScore3;

    if (pScore)
        return pScore;

    // we don't have a pair, so pick the highest ranking card
    pScore = [self alloc];
    pScore->pHighest = pC1;
    if ([pC2 rank] > [pScore->pHighest rank])
        pScore->pHighest = pC2;
    if ([pC3 rank] > [pScore->pHighest rank])
        pScore->pHighest = pC3;
    pScore->handType = 1;
    pScore->handKind = [pScore->pHighest kind];
    pScore->handScore = 9;

    return pScore;
}

+ (int)highestKind:(int)kinds
{
    for(int i = 0x0100; i; i >>= 1)
    {
        if (kinds & i)
            return i;
    }

    return 0;
}

+ (int)pairScore:(int)kind
{
    switch(kind)
    {
    case GTCARD_KIND_HIGH:
        return 81;

    case GTCARD_KIND_DARK:
        return 72;

    case GTCARD_KIND_ASTRAL:
        return 63;

    case GTCARD_KIND_COUNCIL:
        return 54;

    case GTCARD_KIND_ROYAL:
        return 45;

    case GTCARD_KIND_MORTAL:
        return 36;

    case GTCARD_KIND_LUCKY:
        return 27;

    case GTCARD_KIND_LOW:
        return 18;
    }

    // if we got here, we didn't find it
    return 0;
}

+ (GTScore *)pairwiseEvaluate:(GTCard *)pC1 with:(GTCard *)pC2
{
    // check to see if they form a pair
    int kind = [pC1 kind] & [pC2 kind];
    if (!kind)
        return nil;

    // create the score object
    GTScore *pScore = [self alloc];
    pScore->handType = 2;
    pScore->handKind = [GTScore highestKind:kind];
    pScore->handScore = [GTScore pairScore:kind];

    if ([pC1 rank] > [pC2 rank])
        pScore->pHighest = pC1;
    else
        pScore->pHighest = pC2;

    return pScore;
}

@end
