//
//  GTCardButton.h
//  thoth-ios
//
//  Created by Chris Westin on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTCard;
@class GTCardView;

@interface GTCardButton : UIButton
{
    GTCardView *pCardView;
}

// these methods delegate to the contained GTCardView; see that class
- (void)setFaceUp:(bool)faceUp;
- (void)setCard:(GTCard *)pCard;
- (GTCard *)card;

@end
