//
//  LoginViewController.m
//  SearchUsersGit
//
//  Created by Marc Gallardo on 19/10/2019.
//  Copyright © 2019 Marc Gallardo. All rights reserved.
//

#import "LoginViewController.h"
#import "UtilsViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtFIeldUser;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)actLogin:(id)sender {
    if ([self.txtFIeldUser.text isEqualToString:@"nuvolar"] && [self.txtFieldPassword.text isEqualToString:@"nuvolar123"]) {
        
    } else {
        UIAlertController *alertController = [UtilsViewController showAlertLoginError];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}


@end
