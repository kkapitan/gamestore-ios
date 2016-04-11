//
//  CSPage.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSPage : NSObject

@property (nonatomic, assign, readonly) NSInteger limit;
@property (nonatomic, assign, readonly) NSInteger index;

- (instancetype)initWithIndex:(NSInteger)index;
- (instancetype)initWithIndex:(NSInteger)index limit:(NSInteger)limit;

- (CSPage *)nextPage;

@end
