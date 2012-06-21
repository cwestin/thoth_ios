//
//  GTCardButton.m
//  thoth-ios
//
//  Created by Chris Westin on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GTCardButton.h"

#import "GTCardView.h"


@implementation GTCardButton

/*
  When you create a derived class from UIButton, it has to be instantiated
  using "Custom" in IB. This in turn means that it won't be initialized with
  initWithFrame:, but instead it will get initialized with initWithCoder:

  See http://stackoverflow.com/questions/7644617/uibutton-subclass-setting-properties
*/
// override from UIButton
- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self)
    {
        self = [self initWithFrame:self.frame];
    }

    return self;
}

// override from UIButton
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
/*
        CGRect viewFrame;
        viewFrame.origin.x = 0;
        viewFrame.origin.y = 0;
        viewFrame.size.width = frame.size.width;
        viewFrame.size.height = frame.size.height;
*/
        pCardView = [[GTCardView alloc] initWithFrame:self.bounds];
        [self addSubview:pCardView];

        // subviews in UIButtons block touches: http://uihacker.blogspot.com/2010/04/iphone-subviews-in-uibuttons-block.html
        // http://stackoverflow.com/questions/2725254/custom-uibutton-subviews-no-events
        pCardView.userInteractionEnabled = NO;
        pCardView.exclusiveTouch = NO;
    }

    return self;
}


- (void)setFaceUp:(bool)faceUp
{
    [pCardView setFaceUp:faceUp];
}

- (void)setCard:(GTCard *)pCard
{
    [pCardView setCard:pCard];
    NSLog(@"GTCardButton setCard %@ %@", pCard, pCardView);
}

- (GTCard *)card
{
    return [pCardView card];
}

@end
