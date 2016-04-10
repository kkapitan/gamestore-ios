//
//  CSLibraryViewModel.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSUser.h"

//View Models
#import "CSLibraryCellViewModel.h"
#import "CSLibraryHeaderViewModel.h"

@interface CSLibraryViewModel : NSObject

- (instancetype)initWithUser:(CSUser *)user;

- (NSInteger)numberOfItemsInSection:(NSInteger)section;

- (CSGame *)gameAtIndexPath:(NSIndexPath *)indexPath;
- (CSLibraryCellViewModel *)cellViewModelAtIndexPath:(NSIndexPath *)indexPath;

- (CSLibraryHeaderViewModel *)headerViewModel;



@end
