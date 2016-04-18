//
//  CSUpdateUserParams.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSUpdateUserParams.h"

@implementation CSUpdateUserParams

- (instancetype)initWithUser:(CSUploadUser *)user {
    self = [super init];
    if (self) {
        _user = user;
    }
    return self;
}

- (NSDictionary *)params {
    NSMutableDictionary *params = [NSMutableDictionary new];
    
    if (_user.email) {
        [params setObject:_user.email forKey:@"email"];
    }
    
    if (_user.lastName) {
        [params setObject:_user.lastName forKey:@"last_name"];
    }
    
    if (_user.firstName) {
        [params setObject:_user.firstName forKey:@"name"];
    }
    
    if (_user.nickname) {
        [params setObject:_user.nickname forKey:@"nickname"];
    }
    
    return @{ @"user" : params };
}

@end
