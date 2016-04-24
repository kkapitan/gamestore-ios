//
//  CSStoreCellViewModel.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 18.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Models
#import "CSGame.h"

@interface CSStoreCellViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *purchaseButtonString;
@property (nonatomic, strong, readonly) NSString *titleString;

- (instancetype)initWithGame:(CSGame *)game;

@end
