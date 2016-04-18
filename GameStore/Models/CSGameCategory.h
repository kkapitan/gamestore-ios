//
//  CSGameCategory.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "MTLModel.h"

@interface CSGameCategory : MTLModel

@property (nonatomic, strong, readonly) NSString *title;

- (instancetype)initWithTitle:(NSString *)title;

@end
