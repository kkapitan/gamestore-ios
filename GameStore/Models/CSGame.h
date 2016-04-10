//
//  CSGame.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "Mantle.h"

@interface CSGame : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly, assign) NSInteger uid;

@property (nonatomic, readonly, strong) NSString *title;
@property (nonatomic, readonly, strong) NSString *gameDescription;

@property (nonatomic, readonly, assign) CGFloat price;

@end
