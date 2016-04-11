//
//  CSSearchQuery.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSearchQuery.h"

@implementation CSSearchQuery

- (instancetype)initWithKeyword:(NSString *)keyword category:(CSGameCategory *)category {
    self = [super init];
    if (self) {
        _keyword = keyword;
        _category = category;
    }
    return self;
}

@end
