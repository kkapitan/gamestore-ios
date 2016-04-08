//
//  CSSessionOperationsDispatcher.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSessionOperationsDispatcher.h"

@implementation CSSessionOperationsDispatcher

- (void)loginUserWithParams:(CSLoginUserParams *)params completion:(CSSessionOperationsDispatcherCompletionBlock)block {
    
    NSURLRequest *request = [[CSApiClient sharedManager] requestLoginUserWithParams:params];
    
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

- (void)registerUserWithParams:(CSRegisterUserParams *)params completion:(CSSessionOperationsDispatcherCompletionBlock)block {
    
    NSURLRequest *request = [[CSApiClient sharedManager] requestRegisterUserWithParams:params];
    
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

- (void)logoutUserWithCompletion:(CSSessionOperationsDispatcherCompletionBlock)block {
    
    NSURLRequest *request = [[CSApiClient sharedManager] requestLogoutCurrentUser];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [CSUserResponseSerializer serializer];
    
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
