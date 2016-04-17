//
//  CSUserOperationsDispatcher.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 12.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSUserOperationsDispatcher.h"

@implementation CSUserOperationsDispatcher

- (void)updateCurrentUserWithParams:(CSUpdateUserParams *)params completion:(CSUserOperationsDispatcherCompletionBlock)block {
    
    NSURLRequest *request = [[CSApiClient sharedManager] requestUpdateCurrentUserWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [CSUserResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"user"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[CSApiClient sharedManager] enqueueOperation:operation];
}

- (void)fetchUserWithParams:(CSShowUserParams *)params completion:(CSUserOperationsDispatcherCompletionBlock)block {
    
    NSURLRequest *request = [[CSApiClient sharedManager] requestFetchUserWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [CSUserResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"user"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[CSApiClient sharedManager] enqueueOperation:operation];
}

- (void)deleteCurrentUserWithCompletion:(CSUserOperationsDispatcherCompletionBlock)block {
        
    NSURLRequest *request = [[CSApiClient sharedManager] requestDeleteCurrentUser];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, nil, nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[CSApiClient sharedManager] enqueueOperation:operation];
}

@end
