//
//  CSStoreViewController.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 18.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSStoreViewController.h"

//ViewModel
#import "CSStoreViewModel.h"

//Views
#import "CSStoreCollectionViewCell.h"
#import "GameStore-Swift.h"

//Categories
#import "UIScrollView+InfiniteScroll.h"

@interface CSStoreViewController () <CSStoreViewModelDelegate>
@property (nonatomic, strong) CSStoreViewModel *viewModel;
@end

@implementation CSStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [CSStoreViewModel new];
    _viewModel.delegate = self;
    
    [self.collectionView registerNib:[CSStoreCollectionViewCell nib] forCellWithReuseIdentifier:[CSStoreCollectionViewCell reuseIdentifier]];
    
    [_viewModel loadData];
    
    __weak typeof(self) wSelf = self;
    [self.collectionView addInfiniteScrollWithHandler:^(UICollectionView* collectionView) {
        if (!wSelf.viewModel.provider.hasMoreData) {
            [wSelf.collectionView finishInfiniteScroll];
            
            return ;
        }
        
        [wSelf.viewModel fetchNextPage];
    }];
}

#pragma mark -
#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *reuseIdentifier = [CSStoreCollectionViewCell reuseIdentifier];
    CSStoreCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    CSStoreCellViewModel *cellViewModel = [self.viewModel cellViewModelForIndexPath:indexPath];
    [cell populateWithViewModel:cellViewModel];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return (NSInteger)[self.viewModel numberOfObjectsInSection:section];
}

#pragma mark - 
#pragma mark - UICollectionViewDelegate



#pragma mark -
#pragma mark - CSStoreViewModelDelegate

- (void)viewModel:(CSStoreViewModel *)viewModel didEncounterError:(UIAlertController *)alert {
    [self.collectionView finishInfiniteScroll];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewModelDidUpdateData:(CSStoreViewModel *)viewModel {
    [self.collectionView finishInfiniteScroll];
    
    NSUInteger pageIndex = viewModel.provider.page.index;
    NSUInteger pageLimit = viewModel.provider.page.limit;
    
    NSUInteger numberOfItems = [viewModel numberOfObjectsInSection:0];
    NSUInteger numberOfNewItems = numberOfItems - pageIndex * pageLimit;
    
    NSMutableArray *indexPaths = [NSMutableArray new];
    for (NSUInteger index = numberOfItems - numberOfNewItems; index < numberOfItems; index++) {
        [indexPaths addObject:[NSIndexPath indexPathForItem:(NSInteger)index inSection:0]];
    }
    
    __weak typeof(self) wSelf = self;
    [self.collectionView performBatchUpdates:^{
        [wSelf.collectionView insertItemsAtIndexPaths:indexPaths];
    } completion:nil];
}

- (void)viewModeldidUpdateCategories:(CSStoreViewModel *)viewModel {
    BTNavigationDropdownMenu *dropdown = [[BTNavigationDropdownMenu alloc]
                                          initWithTitle:self.navigationItem.title
                                          items:viewModel.categoryNames];
    
    __weak typeof(self) wSelf = self;
    dropdown.didSelectItemAtIndexHandler = ^(NSInteger index){
        CSGameCategory *category = [wSelf.viewModel categoryAtIndex:index];
        self.navigationItem.title = category.title;
        
        wSelf.viewModel.category = [category.title isEqualToString:@"All"] ? nil : category;
        [wSelf.viewModel loadData];
        
        [wSelf.collectionView reloadData];
    };
    
    self.navigationItem.titleView = dropdown;
}

@end
