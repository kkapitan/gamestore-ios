//
//  CSUpdateGameLibraryParams.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRequestParamsProtocol.h"

//Model
#import "CSUser.h"

@interface CSUpdateGameLibraryParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, readonly, strong) CSUser *user;
@property (nonatomic, readonly, strong) CSGame *game;

- (instancetype)initWithUser:(CSUser *)user game:(CSGame *)game;

@end
