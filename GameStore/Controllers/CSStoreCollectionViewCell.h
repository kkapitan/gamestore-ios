//
//  CSStoreCollectionViewCell.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 18.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSCollectionViewCell.h"

//ViewModel
#import "CSStoreCellViewModel.h"

@interface CSStoreCollectionViewCell : CSCollectionViewCell

- (void)populateWithViewModel:(CSStoreCellViewModel *)viewModel;

@end
