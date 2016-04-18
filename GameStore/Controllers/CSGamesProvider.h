//
//  CSGamesProvider.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 17.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSGame.h"
#import "CSSearchQuery.h"
#import "CSPage.h"

//Operations
#import "CSGameOperationsDispatcher.h"

@class CSGamesProvider;

@protocol CSGamesProviderDelegate <NSObject>

- (void)provider:(CSGamesProvider *)provider didFinishLoadingGames:(NSArray <CSGame *> *)games;
- (void)provider:(CSGamesProvider *)provider didFinishWithError:(NSError *)error;

@end

@interface CSGamesProvider : NSObject

@property (nonatomic, readonly, assign, getter=isLoading) BOOL loading;
@property (nonatomic, readonly, assign, getter=hasMoreData) BOOL more;

@property (nonatomic, weak) id<CSGamesProviderDelegate> delegate;

@property (nonatomic, readonly, strong) CSPage *page;
@property (nonatomic, readonly, strong) CSSearchQuery *query;

- (void)loadWithQuery:(CSSearchQuery *)query;
- (void)fetchMore;

@end
