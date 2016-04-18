//
//  CSPage.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSPage : NSObject

@property (nonatomic, assign, readonly) NSUInteger limit;
@property (nonatomic, assign, readonly) NSUInteger index;

- (instancetype)initWithIndex:(NSUInteger)index;
- (instancetype)initWithIndex:(NSUInteger)index limit:(NSUInteger)limit;

- (CSPage *)nextPage;

@end
