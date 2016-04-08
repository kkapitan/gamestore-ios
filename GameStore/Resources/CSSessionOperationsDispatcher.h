//
//  CSSessionOperationsDispatcher.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Client
#import "CSApiClient.h"

//Requests
#import "CSRequests.h"

//Serializers
#import "CSUserResponseSerializer.h"

typedef void(^CSSessionOperationsDispatcherCompletionBlock)(BOOL success, CSUser *user, NSError *error);

@interface CSSessionOperationsDispatcher : NSObject
- (void)loginUserWithParams:(CSLoginUserParams *)params completion:(CSSessionOperationsDispatcherCompletionBlock)block;
@end
