//
//  CSReviewOperationsDispatcher.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 17.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSReviewOperationsDispatcher.h"

@implementation CSReviewOperationsDispatcher

- (void)postReviewWithParams:(CSPostReviewParams *)params completion:(CSReviewOperationsDispatcherCompletionBlock)block {
    
    NSURLRequest *request = [[CSApiClient sharedManager] requestPostReviewWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, error);
        }
    }];
    
    [[CSApiClient sharedManager] enqueueOperation:operation];
}

@end
