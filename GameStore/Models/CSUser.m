//
//  CSUser.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSUser.h"

@interface CSUser ()

@property (nonatomic, strong, readwrite) NSArray <CSGame *> *games;

@end

@implementation CSUser

#pragma mark -
#pragma mark - Serializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid" : @"id",
             @"email" : @"email",
             @"authToken" : @"auth_token",
             @"games" : @"games"
            };
}

+ (NSValueTransformer *)gamesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:CSGame.class];
}

#pragma mark -
#pragma mark - Public

- (instancetype)userByUpdatingGames:(NSArray<CSGame *> *)games {
    CSUser *user = [self copy];
    user.games = games;
    return user;
}

@end
