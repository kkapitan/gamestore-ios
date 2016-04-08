//
//  CSUserResponseSerializer.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSUserResponseSerializer.h"

@implementation CSUserResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];

    CSUser *user = [MTLJSONAdapter modelOfClass:CSUser.class fromJSONDictionary:json[@"user"] error:nil];
    
    NSMutableDictionary *results = [NSMutableDictionary new];
    
    if (json) {
        [results setValue:json forKey:@"payload"];
    }
    
    if (user) {
        [results setValue:user forKey:@"user"];
    }
    
    return results;
}

@end
