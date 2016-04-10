//
//  CSLibraryCellViewModel.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSLibraryCellViewModel.h"

@implementation CSLibraryCellViewModel

- (instancetype)initWithGame:(CSGame *)game {
    self = [super init];
    if (self) {
        _gameTitle = game.title;
    }
    return self;
}

@end
