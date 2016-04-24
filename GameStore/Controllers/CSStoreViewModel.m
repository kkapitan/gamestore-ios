//
//  CSStoreViewModel.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 18.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSStoreViewModel.h"

@interface CSStoreViewModel ()
@property (nonatomic, strong) NSArray <CSGame *> *games;
@property (nonatomic, strong, readonly) NSArray <CSGameCategory *> *categories;
@end

@implementation CSStoreViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _provider = [CSGamesProvider new];
        _provider.delegate = self;
        _games = @[];
    }
    return self;
}

#pragma mark - 
#pragma mark - Public

- (NSUInteger)numberOfObjectsInSection:(NSInteger)section {
    return _games.count;
}

- (CSStoreCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath {
    CSGame *game = [self gameForIndexPath:indexPath];
    return [[CSStoreCellViewModel alloc] initWithGame:game];
}

- (CSGame *)gameForIndexPath:(NSIndexPath *)indexPath {
    return _games[(NSUInteger)indexPath.row];
}

- (void)loadData {
    _games = @[];
    
    CSSearchQuery *query = [[CSSearchQuery alloc] initWithKeyword:_searchText category:_category];
    [self.provider loadWithQuery:query];
}

- (void)fetchNextPage {
    [self.provider fetchMore];
}

- (NSArray<NSString *> *)categoryNames {
    return [self.categories valueForKey:@"title"];
}

- (CSGameCategory *)categoryAtIndex:(NSInteger)index {
    return [self.categories objectAtIndex:(NSUInteger)index];
}

#pragma mark -
#pragma mark - CSGamesProviderDelegate

- (void)provider:(CSGamesProvider *)provider didFinishWithError:(NSError *)error {
    UIAlertController *alert = [UIAlertController alertControllerWithError:error];
    
    [self.delegate viewModel:self didEncounterError:alert];
}

- (void)provider:(CSGamesProvider *)provider didFinishLoadingGames:(NSArray<CSGame *> *)games {
    _games = games;
    
    [self.delegate viewModelDidUpdateData:self];
}

- (void)provider:(CSGamesProvider *)provider didFinishLoadingCategories:(NSArray<CSGameCategory *> *)categories {
    _categories = categories;
    
    [self.delegate viewModeldidUpdateCategories:self];
}

@end
