//
//  CSLibraryTableViewCell.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSLibraryTableViewCell.h"

@interface CSLibraryTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *gameImageView;

@end

@implementation CSLibraryTableViewCell

- (void)populateWithViewModel:(CSLibraryCellViewModel *)viewModel {
    self.titleLabel.text = viewModel.gameTitle;
}

@end
