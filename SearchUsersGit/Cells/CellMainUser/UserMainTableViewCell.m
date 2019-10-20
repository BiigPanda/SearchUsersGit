//
//  UserMainTableViewCell.m
//  SearchUsersGit
//
//  Created by Marc Gallardo on 20/10/2019.
//  Copyright © 2019 Marc Gallardo. All rights reserved.
//

#import "UserMainTableViewCell.h"

@implementation UserMainTableViewCell
@synthesize imageView = _imageView;
@synthesize lblNameUser = _lblNameUser;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
