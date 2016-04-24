//
//  CSCollectionViewCell.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 18.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSCollectionViewCell.h"

@implementation CSCollectionViewCell

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self.class);
}

+ (UINib *)nib {
    return [UINib nibWithNibName:[self reuseIdentifier] bundle:nil];
}

@end
