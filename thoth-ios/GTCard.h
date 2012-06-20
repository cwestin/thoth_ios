//
//  GTCard.h
//  thoth-ios
//
//  Created by Chris Westin on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 All definitions taken from http://www.balmoralsoftware.com/fool/fool.htm#The%20Wheel%20of%20Fortune .
 */
@interface GTCard : NSObject
{
    NSString *pName;
    int rank;
    int kind;
    UIImage *pImage;
}

// overrides from NSObject
- (NSString *)description;


/**
 Initialize a card with it's name and rank
 */
- (id)initCard:(NSString *)pName
      withRank:(int)rank
      andKind:(int)kind
      andImage:(NSString *)imageName;

/**
  Get back the rank of a card
*/
- (int)rank;

/**
 Card kinds.
 
 These are defined as bit flags so that it is possible to perform a bitwise-and
 on all the kinds of a set of cards and obtain the highest kind easily. The
 bits are defined in order of kind so that the highest ranking can easily be
 identified.
 */
#define GTCARD_KIND_HIGH    0x0080
#define GTCARD_KIND_DARK    0x0040
#define GTCARD_KIND_ASTRAL  0x0020
#define GTCARD_KIND_COUNCIL 0x0010
#define GTCARD_KIND_ROYAL   0x0008
#define GTCARD_KIND_MORTAL  0x0004
#define GTCARD_KIND_LUCKY   0x0002
#define GTCARD_KIND_LOW     0x0001

/**
   Get the kind of a card.

   @returns the kind of the card
*/
- (int)kind;

/**
   Retrieve the image for the card
 */
- (UIImage *)image;

@end
