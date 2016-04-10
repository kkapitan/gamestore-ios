//
//  CSLibraryHeaderViewModel.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSLibraryHeaderViewModel.h"

@implementation CSLibraryHeaderViewModel

- (instancetype)initWithUser:(CSUser *)user {
    self = [super init];
    if (self) {
        _userFullName = user.email;
    }
    return self;
}

@end
