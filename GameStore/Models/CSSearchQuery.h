//
//  CSSearchQuery.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Models
#import "CSGameCategory.h"

@interface CSSearchQuery : NSObject

@property (nonatomic, strong, readonly) NSString *keyword;
@property (nonatomic, strong, readonly) CSGameCategory *category;

- (instancetype)initWithKeyword:(NSString *)keyword category:(CSGameCategory *)category;

@end
