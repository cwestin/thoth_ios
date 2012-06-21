//
//  GTCardView.m
//  thoth-ios
//
//  Created by Chris Westin on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GTCardView.h"

#import "GTCard.h"

@implementation GTCardView

// override from UIView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        pImage = nil;
        faceUp = false;
    }

    return self;
}

// override from UIView
- (void)drawRect:(CGRect)rect
{
    NSLog(@"GTCardView drawRect...");

    // figure out how much space we should leave for the borders
    CGFloat border = rect.size.width*0.025;

    // figure out the inner rectangle that will hold the image
    CGRect imageRect;
    imageRect.origin.x = border;
    imageRect.origin.y = border;
    imageRect.size.width = rect.size.width - 2*border;
    imageRect.size.height = rect.size.height - 2*border;

    [[UIColor whiteColor] set];

    if (!pImage)
    {
        // draw the outline
        UIRectFrame(rect);
    }
    else
    {
        UIRectFill(rect);

        if (faceUp)
        {
            // draw the image
            [pImage drawInRect:imageRect];
            NSLog(@"GTCardView drawRect drew image %@", pImage);
        }
        else
        {
            // draw the card back
            [[UIColor grayColor] set];
            UIRectFill(imageRect);
        }
    }
}

- (void)setFaceUp:(bool)fu;
{
    if (faceUp != fu)
    {
        [self setNeedsDisplay];
        faceUp = fu;
    }
}

- (void)setCard:(GTCard *)pC
{
    pCard = pC;
    if (!pCard)
        pImage = nil;
    else
        pImage = [pCard image];

    [self setNeedsDisplay];
}

- (GTCard *)card
{
    return pCard;
}

@end
