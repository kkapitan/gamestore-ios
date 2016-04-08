//
//  CSAccount.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSAccount.h"

@implementation CSAccount

- (instancetype)init {
    self = [super init];
    if (self) {
        self.accountName = @"GameStore";
    }
    return self;
}

@end
