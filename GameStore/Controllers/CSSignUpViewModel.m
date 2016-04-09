//
//  CSSignUpViewModel.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 09.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSignUpViewModel.h"

//Categories
#import "NSString+Validation.h"
#import "UIAlertController+Errors.h"

//Operations
#import "CSSessionOperationsDispatcher.h"

//Account
#import "CSAccount.h"

@implementation CSSignUpViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _email = @"";
        _password = @"";
        _passwordConfirmation = @"";
    }
    return self;
}

- (void)signUpWithCompletion:(CSSignUpCompletionBlock)block {
    
    NSError *validationError = [NSError new];
    if (![self validateCredentials:&validationError]) {
        if (block) {
            block(NO, [UIAlertController alertControllerWithError:validationError]);
        }
        
        return;
    }
    
    CSRegisterUserParams *params = [[CSRegisterUserParams alloc] initWithEmail:_email password:_password confirmation:_passwordConfirmation];
    
    [[CSSessionOperationsDispatcher new] registerUserWithParams:params completion:^(BOOL success, CSUser *user, NSError *error) {
        if (success && !error) {
            [[CSAccount account] registerAccountWithAuthenticationToken:user.authToken expirationDate:nil accountType:AUAccountTypeCustom error:nil];
            
            [[CSAccount account] updateUser:user];
        }
        
        if (block) {
            block(success, error ? [UIAlertController alertControllerWithError:error] : nil);
        }
    }];
}

#pragma mark -
#pragma mark - Private

- (BOOL)validateCredentials:(NSError *__autoreleasing *)error {
    return [self.email isValidEmail:error] &&
    [self.password isValidPassword:error] &&
    [self.passwordConfirmation isValidPasswordConfirmation:self.password error:error];
}

@end
