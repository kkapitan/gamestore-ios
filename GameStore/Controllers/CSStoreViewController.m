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
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewModelDidUpdateData:(CSStoreViewModel *)viewModel {
    [self.collectionView reloadData];
}


@end
