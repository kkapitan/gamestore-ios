//
//  CSError.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface CSError : MTLModel

@property (nonatomic, readonly, assign) NSInteger code;
@property (nonatomic, readonly, strong) NSString *message;
@property (nonatomic, readonly, strong) NSString *key;

- (NSError *)error;

@end
