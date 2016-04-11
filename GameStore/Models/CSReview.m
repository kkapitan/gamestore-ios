//
//  CSReview.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSReview.h"

//Model
#import "CSUser.h"

@implementation CSReview

- (instancetype)initWithTitle:(NSString *)title body:(NSString *)body mark:(NSInteger)mark {
    self = [super init];
    if (self) {
        _title = title;
        _body = body;
        _mark = mark;
    }
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"uid" : @"id",
            @"mark" : @"mark",
            @"body" : @"body",
            @"title" : @"title",
            @"user" : @"user"
            };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [MTLJSONAdapter transformerForModelPropertiesOfClass:CSUser.class];
}

@end
