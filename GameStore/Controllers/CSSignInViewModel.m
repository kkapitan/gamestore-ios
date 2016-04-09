//
//  CSSignInViewModel.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 09.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSignInViewModel.h"

//Categories
#import "NSString+Validation.h"
#import "UIAlertController+Errors.h"

//Operations
#import "CSSessionOperationsDispatcher.h"

//Account
#import "CSAccount.h"

@implementation CSSignInViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _password = @"";
        _email = @"";
    }
    return self;
}

- (void)signInWithCompletion:(CSSignInViewModelCompletionBlock)block {
    
    NSError *validationError = [NSError new];
    if (![self validateCredentials:&validationError]) {
        if (block) {
            block(NO, [UIAlertController alertControllerWithError:validationError]);
        }
        
        return;
    }
    
    CSLoginUserParams *params = [[CSLoginUserParams alloc] initWithEmail:self.email password:self.password];
    [[CSSessionOperationsDispatcher new] loginUserWithParams:params completion:^(BOOL success, CSUser *user, NSError *error) {
        if (!success || error) {
        
            //Register account
            [[CSAccount account] registerAccountWithAuthenticationToken:user.authToken
                                                         expirationDate:nil
                                                            accountType:AUAccountTypeCustom
                                                                  error:nil];
            //Update user
            [[CSAccount account] updateUser:user];
            
        }
        
        if (block) {
            block(success, error ? [UIAlertController alertControllerWithError:error] : nil);
        }
    }];
}

#pragma mark -
#pragma mark - Private

- (BOOL)validateCredentials:(NSError **)error {
    return [self.email isValidEmail:error] && [self.password isValidPassword:error];
}

@end
