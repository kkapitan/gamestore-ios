//
//  CSLibraryCellViewModel.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSGame.h"

@interface CSLibraryCellViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *gameTitle;

- (instancetype)initWithGame:(CSGame *)game;

@end
