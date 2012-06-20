//
//  GTCardView.h
//  thoth-ios
//
//  Created by Chris Westin on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GTCard.h"


@interface GTCardView : UIView
{
    UIImage *pImage;
    bool faceUp;
}

/**
   Set the card to be face up.

   @param faceUp true if the card should be face up, false otherwise
 */
- (void)setFaceUp:(bool)faceUp;

/**
   Set the card to be displayed.

   @param pCard the card to be displayed.
 */
- (void)setCard:(GTCard *)pCard;

@end
