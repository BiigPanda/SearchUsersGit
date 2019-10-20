//
//  User.h
//  SearchUsersGit
//
//  Created by Marc Gallardo on 20/10/2019.
//  Copyright © 2019 Marc Gallardo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface User : NSObject

@property (weak, nonatomic, readwrite) NSString *nameUser;
@property (weak, nonatomic, readwrite) NSString *imageUser;

@end


