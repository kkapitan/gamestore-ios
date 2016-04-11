//
//  CSShowGameParams.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSShowGameParams.h"

@implementation CSShowGameParams

- (instancetype)initWithGameIdentifier:(NSInteger)identifier {
    self = [super init];
    if (self) {
        _gameIdentifier = identifier;
    }
    return self;
}

@end
