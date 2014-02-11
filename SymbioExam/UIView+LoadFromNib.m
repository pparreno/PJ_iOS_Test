//
//  UIView+LoadFromNib.m
//  BestMemories
//
//  Created by Paul John Parreno on 12/3/13.
//  Copyright (c) 2013 Paul John Parreno. All rights reserved.
//

#import "UIView+LoadFromNib.h"

@implementation UIView (LoadFromNib)

- (id)initWithNibName:(NSString *)nibName andBundle:(NSBundle *)bundle
{
    self = [super init];
    if (self) {
        NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
        
        self = [nibViews objectAtIndex:0];
    }

    return self;
}

@end
