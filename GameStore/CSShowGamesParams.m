//
//  CSShowGamesParams.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSShowGamesParams.h"

@implementation CSShowGamesParams

- (instancetype)initWithQuery:(CSSearchQuery *)query page:(CSPage *)page {
    self = [super init];
    if (self) {
        _query = query;
        _page = page;
    }
    return self;
}

@end
