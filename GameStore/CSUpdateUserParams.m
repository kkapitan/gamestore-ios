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

@end
