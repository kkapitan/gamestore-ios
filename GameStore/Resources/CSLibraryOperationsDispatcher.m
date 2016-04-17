//
//  CSLibraryOperationsDispatcher.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 17.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSLibraryOperationsDispatcher.h"

@implementation CSLibraryOperationsDispatcher

- (void)updateGameLibraryWithParams:(CSUpdateGameLibraryParams *)params completion:(CSLibraryOperationsDispatcherCompletionBlock)block {
    NSURLRequest *request = [[CSApiClient sharedManager] requestUpdateGameLibraryWithParams:params];
        
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [CSGamesResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"games"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[CSApiClient sharedManager] enqueueOperation:operation];
}

@end
