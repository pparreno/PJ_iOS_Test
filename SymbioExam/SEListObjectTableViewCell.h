//
//  SEListObjectTableViewCell.h
//  SymbioExam
//
//  Created by Paul John Parreno on 2/11/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LISTOBJ_TABLEVIEWCELL_HEIGHT 76.0f
#define LISTOBJ_TABLEVIEWCELL_ADDRESSLABEL_HEIGHT 18.0f
#define LISTOBJ_TABLEVIEWCELL_ADDRESSLABEL_FONTSIZE 15.0f

@interface SEListObjectTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *phoneNumLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *addressHeightConstraint;

@property (nonatomic, readwrite, copy) NSString *reuseIdentifier;

@end
