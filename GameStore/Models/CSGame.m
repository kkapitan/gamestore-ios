//
//  CSGame.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSGame.h"

@implementation CSGame

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid" : @"id",
             @"title" : @"title",
             @"gameDescription" : @"description",
             @"price" : @"price"
             };
}

+ (NSValueTransformer *)priceJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^NSNumber*(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        return @(value.floatValue);
    } reverseBlock:^NSString*(NSNumber *value, BOOL *success, NSError *__autoreleasing *error) {
        return value.stringValue;
    }];
}

@end
