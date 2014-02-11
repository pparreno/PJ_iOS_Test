//
//  SEListObjectTableViewCell.m
//  SymbioExam
//
//  Created by Paul John Parreno on 2/11/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import "SEListObjectTableViewCell.h"

@implementation SEListObjectTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSString *nibname = @"SEListObjectTableViewCell";
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:nibname owner:nil options:nil];
        
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[SEListObjectTableViewCell class]]) {
                self = (SEListObjectTableViewCell *)currentObject;
                self.reuseIdentifier = reuseIdentifier;
                break;
            }
        }
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleDefault];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
