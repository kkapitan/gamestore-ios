//
//  CSShowUserParams.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSShowUserParams.h"

@implementation CSShowUserParams

- (instancetype)initWithUserIdentifier:(NSInteger)userIdentifier {
    self = [super init];
    if (self) {
        _userIdentifier = userIdentifier;
    }
    return self;
}

- (NSDictionary *)params {
    return @{};
}

@end
