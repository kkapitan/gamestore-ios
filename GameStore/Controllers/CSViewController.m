//
//  CSViewController.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 4/8/16
//  Copyright (c) 2014 Cappsoft. All rights reserved.
//

#import "CSViewController.h"
#import "CSSessionOperationsDispatcher.h"
@interface CSViewController ()

@end


@implementation CSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CSLoginUserParams *params = [[CSLoginUserParams alloc] initWithEmail:@"example@marketplace.com" password:@"12345678"];
    [[CSSessionOperationsDispatcher new] loginUserWithParams:params completion:^(BOOL success, CSUser *user, NSError *error) {
        
    }];
}

@end
