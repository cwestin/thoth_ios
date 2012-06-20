//
//  GTDeck.m
//  thoth-ios
//
//  Created by Chris Westin on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GTDeck.h"

#import <stdlib.h>
#import <time.h>

#import "GTCard.h"


@implementation GTDeck

- (id)init
{
    self = [super init];
    if (self)
    {
        GTCard *pCard;
        
        pA = [[NSMutableArray alloc] initWithCapacity:21];
        
        pCard = [[GTCard alloc] initCard:@"Death"
                                withRank:21
                                 andKind:GTCARD_KIND_DARK
                                andImage:@"RWS_TAROT_13_Death.jpg"];
        [pA addObject:pCard];

        pCard = [[GTCard alloc] initCard:@"The Magician"
                                withRank:20
                                 andKind:GTCARD_KIND_HIGH
                                andImage:@"RWS_TAROT_01_Magician.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The High Priestess"
                                withRank:19
                                 andKind:GTCARD_KIND_DARK
                                andImage:@"RWS_TAROT_02_High_Priestess.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The Hierophant"
                                withRank:18
                                 andKind:(GTCARD_KIND_COUNCIL |
                                          GTCARD_KIND_ROYAL)
                                andImage:@"RWS_TAROT_05_Hierophant.jpg"];
        [pA addObject:pCard];

        pCard = [[GTCard alloc] initCard:@"The Devil"
                                withRank:17
                                 andKind:GTCARD_KIND_DARK
                                andImage:@"RWS_TAROT_15_Devil.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The World"
                                withRank:16
                                 andKind:GTCARD_KIND_ASTRAL
                                andImage:@"RWS_TAROT_21_World.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The Moon"
                                withRank:15
                                 andKind:GTCARD_KIND_ASTRAL
                                andImage:@"RWS_TAROT_18_Moon.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The Star"
                                withRank:14
                                 andKind:GTCARD_KIND_ASTRAL
                                andImage:@"RWS_TAROT_17_Star.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"Justice"
                                withRank:13
                                 andKind:GTCARD_KIND_COUNCIL
                                andImage:@"RWS_TAROT_11_Justice.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"Judgement"
                                withRank:12
                                 andKind:GTCARD_KIND_COUNCIL
                                andImage:@"RWS_TAROT_20_Judgement.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"Strength"
                                withRank:11
                                 andKind:GTCARD_KIND_MORTAL
                                andImage:@"RWS_TAROT_08_Strength.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The Emperor"
                                withRank:10
                                 andKind:GTCARD_KIND_ROYAL
                                andImage:@"RWS_TAROT_04_Emperor.jpg"];

        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The Empress"
                                withRank:9
                                 andKind:GTCARD_KIND_ROYAL
                                andImage:@"RWS_TAROT_03_Empress.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The Hanged Man"
                                withRank:8
                                 andKind:(GTCARD_KIND_MORTAL |
                                          GTCARD_KIND_LUCKY)
                                andImage:@"RWS_TAROT_12_Hanged_Man.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The Hermit"
                                withRank:7
                                 andKind:(GTCARD_KIND_ROYAL |
                                          GTCARD_KIND_MORTAL)
                                andImage:@"RWS_TAROT_09_Hermit.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The Wheel of Fortune"
                                withRank:6
                                 andKind:GTCARD_KIND_LUCKY
                                andImage:@"RWS_TAROT_10_Wheel_of_Fortune.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"Temperance"
                                withRank:5
                                 andKind:GTCARD_KIND_COUNCIL
                                andImage:@"RWS_TAROT_14_Temperance.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The Tower"
                                withRank:4
                                 andKind:GTCARD_KIND_LOW
                                andImage:@"RWS_TAROT_16_Tower.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The Chariot"
                                withRank:3
                                 andKind:(GTCARD_KIND_MORTAL |
                                          GTCARD_KIND_LOW)
                                andImage:@"RWS_TAROT_07_Chariot.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The Lovers"
                                withRank:2
                                 andKind:(GTCARD_KIND_LUCKY | GTCARD_KIND_LOW)
                                andImage:@"RWS_TAROT_06_Lovers.jpg"];
        [pA addObject:pCard];
        
        pCard = [[GTCard alloc] initCard:@"The Fool"
                                withRank:1
                                 andKind:(GTCARD_KIND_HIGH | GTCARD_KIND_LUCKY |
                                          GTCARD_KIND_LOW)
                                andImage:@"RWS_TAROT_00_Fool.jpg"];
        [pA addObject:pCard];

        srand(1); // until we get it debugged, then use the below
        //srand(time(NULL));
        [self shuffle];
    }
    
    return self;
}

- (void)shuffle
{
    const size_t n = pA.count;
    
    // mix things around well
    for(int i = 0; i < 197; ++i)
    {
        const size_t r1 = rand() % n;
        const size_t r2 = rand() % n;
        
        [pA exchangeObjectAtIndex:r1 withObjectAtIndex:r2];
    }
    
    // we restart the deal
    nextCard = 0;
}

- (GTCard *)deal
{
    if (nextCard >= pA.count)
        return nil;
    
    return [pA objectAtIndex:nextCard++];
}

@end
