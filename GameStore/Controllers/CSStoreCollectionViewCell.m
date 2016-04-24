//
//  CSStoreCollectionViewCell.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 18.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSStoreCollectionViewCell.h"

@interface CSStoreCollectionViewCell ()

@property (nonatomic, strong) CSStoreCellViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UIImageView *gameImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *purchaseButton;

@end

@implementation CSStoreCollectionViewCell

- (void)populateWithViewModel:(CSStoreCellViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.titleLabel.text = viewModel.titleString;
    
    [self.purchaseButton setTitle:viewModel.purchaseButtonString forState:UIControlStateNormal];
}

@end
