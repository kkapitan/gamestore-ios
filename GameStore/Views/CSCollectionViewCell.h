//
//  CSCollectionViewCell.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 18.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSCollectionViewCell : UICollectionViewCell

+ (NSString *)reuseIdentifier;
+ (UINib *)nib;

@end
