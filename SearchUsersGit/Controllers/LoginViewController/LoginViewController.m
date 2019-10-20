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
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtFIeldUser.delegate = self;
    self.txtFieldPassword.delegate = self;
    [self setScrollview];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardWillHide:)];
    [self.scrollView addGestureRecognizer:tapGestureRecognizer];
}

- (IBAction)actLogin:(id)sender {
    if ([self.txtFIeldUser.text isEqualToString:@"nuvolar"] && [self.txtFieldPassword.text isEqualToString:@"nuvolar123"]) {
        
    } else {
        UIAlertController *alertController = [UtilsViewController showAlertLoginError];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark - TextField Delegates

// This method is called once we click inside the textField
-(void)textFieldDidBeginEditing:(UITextField *)textField {
   NSLog(@"Text field did begin editing");
}

// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)textField {
   NSLog(@"Text field ended editing");
}

// This method enables or disables the processing of return key
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
   [textField resignFirstResponder];
   return YES;
}

#pragma mark - Keyboard Notifications

- (void) setScrollview {
      UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
      UIView *mainView = self.view;
      self.view = scrollView;
      [scrollView addSubview:mainView];
      scrollView.contentSize = mainView.frame.size;
      scrollView.backgroundColor = mainView.backgroundColor;
      self.scrollView = scrollView;
      
      [[NSNotificationCenter defaultCenter] addObserver:self
      selector:@selector(keyboardWillShow:)
      name:UIKeyboardDidShowNotification object:nil];

      [[NSNotificationCenter defaultCenter] addObserver:self
      selector:@selector(keyboardWillHide:)
      name:UIKeyboardWillHideNotification object:nil];
}

- (void) keyboardWillShow:(NSNotification *) notification {
       NSDictionary* info = [notification userInfo];
       CGSize kbSize = [[info        objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
       UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, kbSize.height, 0);

       self.scrollView.contentInset = contentInsets;
      [self.scrollView setContentOffset:CGPointMake(0, 120) animated:YES];
}

- (void) keyboardWillHide:(NSNotification *) notification {
       UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, 0, 0);
       self.scrollView.contentInset = contentInsets;
       self.scrollView.scrollIndicatorInsets = contentInsets;
       [self.view endEditing:YES];
}



@end
