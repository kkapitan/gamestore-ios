//
//  CSLibraryViewModel.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSLibraryViewModel.h"

@interface CSLibraryViewModel ()

@property (nonatomic, strong) CSUser *user;

@end

@implementation CSLibraryViewModel

- (instancetype)initWithUser:(CSUser *)user {
    self = [super init];
    if (self) {
        _user = user;
    }
    return self;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    return (NSInteger)_user.games.count;
}

- (CSLibraryCellViewModel *)cellViewModelAtIndexPath:(NSIndexPath *)indexPath {
    CSGame *game = [self gameAtIndexPath:indexPath];
    
    return [[CSLibraryCellViewModel alloc] initWithGame:game];
}

- (CSGame *)gameAtIndexPath:(NSIndexPath *)indexPath {
    return _user.games[(NSUInteger)indexPath.row];
}

- (CSLibraryHeaderViewModel *)headerViewModel {
    return [[CSLibraryHeaderViewModel alloc] initWithUser:_user];
}

@end
