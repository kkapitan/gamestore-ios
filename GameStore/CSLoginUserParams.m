//
//  CSLoginUserParams.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSLoginUserParams.h"

@implementation CSLoginUserParams

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password {
    self = [super init];
    if (self) {
        _password = password;
        _email = email;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
             @"email":_email,
             @"password":_password
            };
}

@end
