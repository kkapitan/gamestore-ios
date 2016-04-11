//
//  CSPostReviewParams.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRequestParamsProtocol.h"

//Models
#import "CSGame.h"
#import "CSReview.h"
#import "CSUser.h"

@interface CSPostReviewParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, strong, readonly) CSGame *game;
@property (nonatomic, strong, readonly) CSReview *review;
@property (nonatomic, strong, readonly) CSUser *user;

- (instancetype)initWithGame:(CSGame *)game review:(CSReview *)review user:(CSUser *)user;

@end
