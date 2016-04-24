//
//  CSStoreCellViewModel.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 18.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSStoreCellViewModel.h"

@implementation CSStoreCellViewModel

- (instancetype)initWithGame:(CSGame *)game {
    self = [super init];
    if (self) {
        _titleString = game.title;
        _purchaseButtonString = [NSString stringWithFormat:@"Purchase for %f", game.price];
    }
    return self;
}

@end
