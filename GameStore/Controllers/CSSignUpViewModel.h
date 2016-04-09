//
//  CSSignUpViewModel.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 09.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CSSignUpCompletionBlock)(BOOL success, UIAlertController *alert);

@interface CSSignUpViewModel : NSObject

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *passwordConfirmation;

- (void)signUpWithCompletion:(CSSignUpCompletionBlock)block;

@end
