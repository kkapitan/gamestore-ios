//
//  CSError.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSError.h"

@implementation CSError

- (NSError *)error {
    
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey:self.message ?: self.key,
                               NSHelpAnchorErrorKey: self.key
                               };
    
    return [NSError errorWithDomain:@"com.appunite.supeuser.error-domain" code:self.code userInfo:userInfo];
}

#pragma mark -
#pragma mark Mappings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"code": @"code",
             @"key": @"key",
             @"message": @"description"
             };
}

#pragma mark -
#pragma mark Others

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"code"]) {
        _code = 0;
    } else {
        [super setNilValueForKey:key];
    }
}

@end

