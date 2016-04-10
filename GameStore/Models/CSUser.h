//
//  CSUser.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

//Models
#import "CSGame.h"

@interface CSUser : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign, readonly) NSInteger uid;

@property (nonatomic, strong, readonly) NSString *email;
@property (nonatomic, strong, readonly) NSString *authToken;

@property (nonatomic, strong, readonly) NSArray <CSGame *> *games;

- (instancetype)userByUpdatingGames:(NSArray <CSGame *> *)games;

@end
