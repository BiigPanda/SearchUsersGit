//
//  UtilsViewController.m
//  SearchUsersGit
//
//  Created by Marc Gallardo on 20/10/2019.
//  Copyright © 2019 Marc Gallardo. All rights reserved.
//

#import "UtilsViewController.h"

@interface UtilsViewController ()

@end

@implementation UtilsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (UIAlertController *) showAlertLoginError{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"The user or password is incorrect please try again" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        }];
    [alertController addAction:okAction];
    return alertController;
}


@end
