//
//  CSPage.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSPage.h"

@implementation CSPage

- (instancetype)init {
    self = [super init];
    if (self) {
        _index = 0;
        _limit = 5;
    }
    return self;
}

- (instancetype)initWithIndex:(NSUInteger)index {
    self = [self init];
    if (self) {
        _index = index;
    }
    return self;
}

- (instancetype)initWithIndex:(NSUInteger)index limit:(NSUInteger)limit {
    self = [self initWithIndex:index];
    if (self) {
        _limit = limit;
    }
    return self;
}

- (CSPage *)nextPage {
    return [[CSPage alloc] initWithIndex:self.index + 1];
}

@end
