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

- (NSDictionary *)params {
    NSMutableDictionary *params = [NSMutableDictionary new];
    
    [params setObject:@(_page.limit) forKey:@"limit"];
    [params setObject:@(_page.index) forKey:@"page"];
    
    if (_query.keyword && ![_query.keyword isEqualToString:@""]) {
        [params setObject:_query.keyword forKey:@"keyword"];
    }
    
    if (_query.category) {
        [params setObject:_query.category forKey:@"category"];
    }
    
    return params;
}

@end
