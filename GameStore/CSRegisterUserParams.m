//
//  CSRegisterUserParams.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRegisterUserParams.h"

@implementation CSRegisterUserParams

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password confirmation:(NSString *)passwordConfirmation {
    self = [super init];
    if(self) {
        _password = password;
        _passwordConfirmation = passwordConfirmation;
        _email = email;
    }
    return self;
}

- (NSDictionary *)params {
    return @{ @"user" : @{
             @"email" : _email,
             @"password" : _password,
             @"password_confirmation": _passwordConfirmation
             }
            };
}

@end
