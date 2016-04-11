//
//  CSGameCategory.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSGameCategory : NSObject

@property (nonatomic, strong, readonly) NSString *title;

- (instancetype)initWithTitle:(NSString *)title;

@end
