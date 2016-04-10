//
//  CSLibraryTableViewHeader.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSView.h"

//View Model
#import "CSLibraryHeaderViewModel.h"

@interface CSLibraryTableViewHeader : CSView

- (void)populateWithViewModel:(CSLibraryHeaderViewModel *)viewModel;

@end
