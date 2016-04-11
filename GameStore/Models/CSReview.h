//
//  CSReview.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

@class CSUser;

@interface CSReview : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign, readonly) NSInteger uid;
@property (nonatomic, assign, readonly) NSInteger mark;

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *body;

@property (nonatomic, assign, readonly) CSUser *user;

- (instancetype)initWithTitle:(NSString *)title
                         body:(NSString *)body
                         mark:(NSInteger)mark;

@end
