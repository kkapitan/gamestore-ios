//
//  CSUpdateGameLibraryParams.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSUpdateGameLibraryParams.h"

@implementation CSUpdateGameLibraryParams

- (instancetype)initWithUser:(CSUser *)user game:(CSGame *)game {
    self = [super init];
    if (self) {
        _user = user;
        _game = game;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
             @"user_id" : @(_user.uid),
             @"game_id" : @(_game.uid)
             };
}

@end
