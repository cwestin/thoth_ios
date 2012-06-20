//
//  GTHand.m
//  thoth-ios
//
//  Created by Chris Westin on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GTHand.h"

@implementation GTHand

// overrides from NSObject
- (id) init
{
    self = [super init];
    if (self)
    {
        pHand = [[NSMutableArray alloc] initWithCapacity:3];
        pScore = nil;
    }

    return self;
}


- (bool) addCard:(GTCard *)pCard
{
    if (pHand.count >= 3)
        return false;

    [pHand addObject:pCard];
    pScore = nil; // mark the hand as 'dirty'

    return true;
}

@end
