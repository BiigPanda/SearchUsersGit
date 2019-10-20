//
//  UsersViewController.h
//  SearchUsersGit
//
//  Created by Marc Gallardo on 20/10/2019.
//  Copyright © 2019 Marc Gallardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "UserMainTableViewCell.h"

@interface UsersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> 
@property (weak, nonatomic) NSMutableArray *allUsers;
@end

