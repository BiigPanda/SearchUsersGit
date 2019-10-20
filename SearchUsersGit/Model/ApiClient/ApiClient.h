//
//  ApiClient.h
//  SearchUsersGit
//
//  Created by Marc Gallardo on 20/10/2019.
//  Copyright © 2019 Marc Gallardo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "User.h"

@interface ApiClient : NSObject

+ (void ) initialCall;
+ (NSMutableArray *) parse:(NSDictionary *) JSON;
@property (weak, nonatomic, readwrite) NSMutableArray *allUsers;



@end

