//
//  CSGameOperationsDispatcher.h
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
#import "CSGameResponseSerializer.h"
#import "CSGamesResponseSerializer.h"

typedef void(^CSGameOperationsDispatcherGameCompletionBlock)(BOOL success, CSGame *game, NSError *error);
typedef void(^CSGameOperationsDispatcherGamesCompletionBlock)(BOOL success, NSArray <CSGame *> *games, NSArray<CSGameCategory *> *categories, NSError *error);

@interface CSGameOperationsDispatcher : NSObject

- (instancetype)initWithQueue:(NSOperationQueue *)queue;

- (void)fetchGameWithParams:(CSShowGameParams *)params completion:(CSGameOperationsDispatcherGameCompletionBlock)block;
- (void)fetchGamesWithParams:(CSShowGamesParams *)params completion:(CSGameOperationsDispatcherGamesCompletionBlock)block;

@end
