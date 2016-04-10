//
//  CSLibraryTableViewCell.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTableViewCell.h"

//View Model
#import "CSLibraryCellViewModel.h"

@interface CSLibraryTableViewCell : CSTableViewCell

- (void)populateWithViewModel:(CSLibraryCellViewModel *)viewModel;

@end
