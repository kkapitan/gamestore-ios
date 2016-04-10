//
//  CSLibraryTableViewHeader.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSLibraryTableViewHeader.h"

@interface CSLibraryTableViewHeader ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end

@implementation CSLibraryTableViewHeader

- (void)populateWithViewModel:(CSLibraryHeaderViewModel *)viewModel {
    self.nameLabel.text = viewModel.userFullName;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end
