//
//  GTCard.m
//  thoth-ios
//
//  Created by Chris Westin on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GTCard.h"

@implementation GTCard

- (NSString *)description
{
    return pName;
}

- (id)initCard:(NSString *)pN withRank:(int)r andKind:(int)k
      andImage:(NSString *)imageName
{
    self = [super init];
    if (self)
    {
        pName = pN;
        rank = r;
        kind = k;
        pImage = [UIImage imageNamed:imageName];
    }
    
    return self;
}

- (int)kind
{
    return kind;
}

- (int)rank
{
    return rank;
}

- (UIImage *)image
{
    return pImage;
}

@end
