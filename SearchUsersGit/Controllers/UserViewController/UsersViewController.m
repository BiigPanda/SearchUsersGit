//
//  UsersViewController.m
//  SearchUsersGit
//
//  Created by Marc Gallardo on 20/10/2019.
//  Copyright © 2019 Marc Gallardo. All rights reserved.
//

#import "UsersViewController.h"
#import "ApiClient.h"

@interface UsersViewController ()
@property (weak, nonatomic) IBOutlet UITableView *userTableView;
@end

@implementation UsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userTableView.delegate = self;
    self.userTableView.dataSource = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0),
                      ^{
                             [ApiClient initialCall];
                           dispatch_sync(dispatch_get_main_queue(),
                                         ^{
                               [self.userTableView reloadData];
                                          });
                       });
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"users");

}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"mainUserCell";
    
       UserMainTableViewCell *cell = (UserMainTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
       if (cell == nil)
       {
           NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UserMainTableViewCell" owner:self options:nil];
           cell = [nib objectAtIndex:0];
       }
    
    cell.lblNameUser.text = [self.allUsers[indexPath.row]objectForKey:@""];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (void)methodAWithCompletion:(void (^) (BOOL success))completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, kNilOptions), ^{

        // go do something asynchronous...
         [ApiClient initialCall];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(self.allUsers);
        });
    });
}


@end
