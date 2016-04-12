//
//  CSGameResponseSerializer.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 12.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSGameResponseSerializer.h"

@implementation CSGameResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    
    NSError *validationError;
    CSGame *game = [MTLJSONAdapter modelOfClass:CSGame.class fromJSONDictionary:json[@"game"] error:&validationError];
    
    NSMutableDictionary *results = [NSMutableDictionary new];
    
    if (json) {
        [results setValue:json forKey:@"payload"];
    }
    
    if (game) {
        [results setValue:game forKey:@"game"];
    }
    
    return results;
}

@end
