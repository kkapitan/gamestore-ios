//
//  CSUploadUser.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSUploadUser.h"

@implementation CSUploadUser

- (instancetype)initWithUser:(CSUser *)user {
    self = [super init];
    if (self) {
        _firstName = user.firstName;
        _lastName = user.lastName;
        _nickname = user.nickname;
        
        _avatarURL = user.avatarURL;
        _email = user.email;
        
        _uid = user.uid;
    }
    return self;
}

@end
