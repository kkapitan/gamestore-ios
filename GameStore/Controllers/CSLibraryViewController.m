//
//  CSLibraryViewController.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSLibraryViewController.h"

//View model
#import "CSLibraryViewModel.h"

//Views
#import "CSLibraryTableViewCell.h"
#import "CSLibraryTableViewHeader.h"

//Account
#import "CSAccount.h"

@interface CSLibraryViewController ()

@property (nonatomic, strong) CSLibraryViewModel *viewModel;

@end

@implementation CSLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[CSLibraryTableViewCell nib] forCellReuseIdentifier:[CSLibraryTableViewCell reuseIdentifier]];
    
    self.tableView.estimatedRowHeight = 74.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    _viewModel = [[CSLibraryViewModel alloc] initWithUser:_user ?: [CSAccount account].user];
    
    [self prepareTableViewHeader];

    [self.tableView reloadData];
}

#pragma mark -
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_viewModel numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *reuseIdentifier = [CSLibraryTableViewCell reuseIdentifier];
    CSLibraryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    CSLibraryCellViewModel *cellViewModel  = [_viewModel cellViewModelAtIndexPath:indexPath];
    [cell populateWithViewModel:cellViewModel];
    
    return  cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate

#pragma mark -
#pragma mark - Private

- (void)prepareTableViewHeader {
    CSLibraryTableViewHeader *header = [CSLibraryTableViewHeader view];
    [header populateWithViewModel:[_viewModel headerViewModel]];
    
    self.tableView.tableHeaderView = header;
}


@end
