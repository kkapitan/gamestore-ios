//
//  CSStoreViewModel.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 18.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Provider
#import "CSGamesProvider.h"

//ViewModel
#import "CSStoreCellViewModel.h"

//Categories
#import "UIAlertController+Errors.h"

@class CSStoreViewModel;

@protocol CSStoreViewModelDelegate <NSObject>

- (void)viewModel:(CSStoreViewModel *)viewModel didEncounterError:(UIAlertController *)alert;
- (void)viewModeldidUpdateCategories:(CSStoreViewModel *)viewModel;
- (void)viewModelDidUpdateData:(CSStoreViewModel *)viewModel;

@end

@interface CSStoreViewModel : NSObject <CSGamesProviderDelegate>

@property (nonatomic, readonly, strong) CSGamesProvider *provider;

@property (nonatomic, strong) NSString *searchText;
@property (nonatomic, strong) CSGameCategory *category;

@property (nonatomic, weak) id<CSStoreViewModelDelegate> delegate;

- (NSUInteger)numberOfObjectsInSection:(NSInteger)section;
- (CSStoreCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath;
- (CSGame *)gameForIndexPath:(NSIndexPath *)indexPath;

- (NSArray <NSString *> *)categoryNames;
- (CSGameCategory *)categoryAtIndex:(NSInteger)index;

- (void)loadData;
- (void)fetchNextPage;

@end
