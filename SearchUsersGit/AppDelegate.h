//
//  AppDelegate.h
//  SearchUsersGit
//
//  Created by Marc Gallardo on 19/10/2019.
//  Copyright © 2019 Marc Gallardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

