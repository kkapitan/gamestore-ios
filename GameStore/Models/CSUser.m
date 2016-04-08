//
//  CSUser.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSUser.h"

@implementation CSUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"email" : @"email",
             @"authToken" : @"auth_token"
            };
}

@end
