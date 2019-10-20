//
//  ApiClient.m
//  SearchUsersGit
//
//  Created by Marc Gallardo on 20/10/2019.
//  Copyright © 2019 Marc Gallardo. All rights reserved.
//

#import "ApiClient.h"

@implementation ApiClient

+ (void) initialCall {
    NSURL *URL = [NSURL URLWithString:@"https://api.github.com/users"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"token=dc7887c6ff93163d6fdf86cffe5750378df719e2" forHTTPHeaderField:@"Authorization"];
    [manager GET:URL.absoluteString
           parameters:nil
             progress:nil
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  NSLog(@"Reply POST JSON: %@", responseObject);
                  NSDictionary *jsonDict = (NSDictionary *) responseObject;
                  [self parse:jsonDict];
              }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  NSLog(@"error: %@", error);
              }
         ];
}

+ (NSMutableArray *) parse:(NSDictionary *) JSON {
    NSMutableArray *users = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in JSON) {
                           User *user = [[User alloc]init];
                           user.nameUser = [dict objectForKey:@"login"];
                           user.imageUser = [dict objectForKey:@"avatar_url"];
                           [users addObject:user];
                       }
   return users;
}

@end
