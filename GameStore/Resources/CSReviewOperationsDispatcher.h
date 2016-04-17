//
//  CSReviewOperationsDispatcher.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 17.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSReview.h"

//Networking
#import "CSApiClient.h"
#import "CSRequests.h"

typedef void(^CSReviewOperationsDispatcherCompletionBlock)(BOOL success, NSError *error);

@interface CSReviewOperationsDispatcher : NSObject

- (void)postReviewWithParams:(CSPostReviewParams *)params completion:(CSReviewOperationsDispatcherCompletionBlock)block;

@end
