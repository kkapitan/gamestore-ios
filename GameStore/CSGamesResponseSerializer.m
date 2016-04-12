//
//  CSGamesResponseSerializer.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 12.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSGamesResponseSerializer.h"

@implementation CSGamesResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    
    NSArray *gamesJson = json[@"games"][0];
    
    NSError *validationError;
    NSArray <CSGame *> *games = [MTLJSONAdapter modelsOfClass:CSGame.class fromJSONArray:gamesJson error:&validationError];
    
    NSMutableArray <CSGameCategory *> *categories = [NSMutableArray new];
    if ([(NSArray *)json[@"games"] count] > 1) {
        
        
        NSArray *categoriesStrings = json[@"games"][1][@"categories"];
        for (NSString *categoryName in categoriesStrings) {
            [categories addObject:[[CSGameCategory alloc] initWithTitle:categoryName]];
        }
    }
    
    NSMutableDictionary *results = [NSMutableDictionary new];
    
    if (json) {
        [results setValue:json forKey:@"payload"];
    }
    
    if (games.count) {
        [results setValue:games forKey:@"games"];
    }
    
    if (categories.count) {
        [results setValue:categories forKey:@"categories"];
    }
    
    return results;
}


@end
