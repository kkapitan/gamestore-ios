//
//  CSLibraryOperationsDispatcher.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 17.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSGame.h"

//Networking
#import "CSApiClient.h"
#import "CSRequests.h"
#import "CSGamesResponseSerializer.h"

typedef void(^CSLibraryOperationsDispatcherCompletionBlock)(BOOL success, NSArray <CSGame *> *games, NSError *error);

@interface CSLibraryOperationsDispatcher : NSObject

- (void)updateGameLibraryWithParams:(CSUpdateGameLibraryParams *)params completion:(CSLibraryOperationsDispatcherCompletionBlock)block;

@end
