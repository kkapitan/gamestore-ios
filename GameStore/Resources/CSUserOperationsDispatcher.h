//
//  CSUserOperationsDispatcher.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 12.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSUser.h"

//Networking
#import "CSApiClient.h"
#import "CSRequests.h"
#import "CSUserResponseSerializer.h"

typedef void(^CSUserOperationsDispatcherCompletionBlock)(BOOL success, CSUser *user, NSError *error);

@interface CSUserOperationsDispatcher : NSObject

- (void)fetchUserWithParams:(CSShowUserParams *)params completion:(CSUserOperationsDispatcherCompletionBlock)block;

- (void)updateCurrentUserWithParams:(CSUpdateUserParams *)params completion:(CSUserOperationsDispatcherCompletionBlock)block;

- (void)deleteCurrentUserWithCompletion:(CSUserOperationsDispatcherCompletionBlock)block;

@end
