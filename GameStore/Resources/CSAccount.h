//
//  CSAccount.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <AUAccount/AUAccount.h>
#import "CSUser.h"

@interface CSAccount : AUAccount

@property (nonatomic, strong, readonly) CSUser *user;

@end
