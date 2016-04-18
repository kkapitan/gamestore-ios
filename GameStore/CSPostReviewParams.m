//
//  CSPostReviewParams.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSPostReviewParams.h"

@implementation CSPostReviewParams

- (instancetype)initWithGame:(CSGame *)game review:(CSReview *)review user:(CSUser *)user {
    self = [super init];
    if (self) {
        _game = game;
        _user = user;
        _review = review;
    }
    return self;
}

- (NSDictionary *)params {
    return @{ @"review" : @{
                  @"body" : _review.body,
                  @"title" : _review.title,
                  @"mark" : @(_review.mark),
                  @"user_id": @(_user.uid),
                  @"game_id": @(_game.uid),
                }
            };
}

@end
