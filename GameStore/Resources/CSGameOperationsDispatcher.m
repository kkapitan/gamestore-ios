//
//  CSGameOperationsDispatcher.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 17.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSGameOperationsDispatcher.h"

@interface CSGameOperationsDispatcher ()
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation CSGameOperationsDispatcher

- (instancetype)initWithQueue:(NSOperationQueue *)queue {
    self = [super init];
    if (self) {
        _queue = queue;
    }
    return self;
}

- (void)fetchGameWithParams:(CSShowGameParams *)params completion:(CSGameOperationsDispatcherGameCompletionBlock)block {
    
    NSURLRequest *request = [[CSApiClient sharedManager] requestFetchGameWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [CSGameResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"game"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    _queue ? [_queue addOperation:operation] : [[CSApiClient sharedManager] enqueueOperation:operation];
}

- (void)fetchGamesWithParams:(CSShowGamesParams *)params completion:(CSGameOperationsDispatcherGamesCompletionBlock)block {
    
    NSURLRequest *request = [[CSApiClient sharedManager] requestFetchGamesWithParams:params];
    
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
    
    _queue ? [_queue addOperation:operation] : [[CSApiClient sharedManager] enqueueOperation:operation];
}


@end
