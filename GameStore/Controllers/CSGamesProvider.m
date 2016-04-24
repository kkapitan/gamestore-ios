//
//  CSGamesProvider.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 17.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSGamesProvider.h"

@interface CSGamesProvider ()
@property (nonatomic, assign, readwrite) BOOL loading;
@property (nonatomic, assign, readwrite) BOOL more;

@property (nonatomic, strong) NSOperationQueue *queue;

@property (nonatomic, strong) NSMutableArray <CSGame *> *games;
@property (nonatomic, strong) CSGameOperationsDispatcher *gamesFetcher;

@end

@implementation CSGamesProvider

- (instancetype)init {
    self = [super init];
    if (self) {
        _queue = [NSOperationQueue new];
        _queue.maxConcurrentOperationCount = 1;
        _gamesFetcher = [[CSGameOperationsDispatcher alloc] initWithQueue:_queue];
    }
    return self;
}

- (void)fetchMore {
    if (_loading || !_more) {
        return ;
    }
    
    _page = [_page nextPage];
    
    [self loadData];
}

- (void)loadWithQuery:(CSSearchQuery *)query {
    [_queue cancelAllOperations];
    
    _page = [CSPage new];
    _query = query;
    
    _more = YES;
    [self loadData];
}

- (void)loadData {
    CSShowGamesParams *params = [[CSShowGamesParams alloc] initWithQuery:_query page:_page];
    
    __weak typeof(self) wSelf = self;
    
    _loading = YES;
    [self.gamesFetcher fetchGamesWithParams:params completion:^(BOOL success, NSArray<CSGame *> *games, NSArray<CSGameCategory *> *categories, NSError *error) {
        wSelf.loading = NO;
        
        if (!success && error) {
            [wSelf.delegate provider:wSelf didFinishWithError:error];
        
            return;
        }
        
        if (wSelf.page.index == 0) {
            wSelf.games = [NSMutableArray new];
            [wSelf.delegate provider:wSelf didFinishLoadingCategories:[categories copy]];
        }
        
        wSelf.more = games.count == wSelf.page.limit;
        [wSelf.games addObjectsFromArray:games];
        
        [wSelf.delegate provider:wSelf didFinishLoadingGames:[wSelf.games copy]];
    }];
}

@end
