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
}

- (void) viewWillAppear:(BOOL)animated {
    self.txtFIeldUser.text = @"";
    self.txtFieldPassword.text = @"";
}

- (IBAction)actLogin:(id)sender {
    if ([self.txtFIeldUser.text isEqualToString:@"nuvolar"] && [self.txtFieldPassword.text isEqualToString:@"nuvolar123"]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"Users"];
        [self presentViewController:vc animated:YES completion:nil];
    } else {
        UIAlertController *alertController = [UtilsViewController showAlertLoginError];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark - TextField Delegates

-(void)textFieldDidBeginEditing:(UITextField *)textField {
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
}

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
    
      UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardWillHide:)];
     [self.scrollView addGestureRecognizer:tapGestureRecognizer];
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
