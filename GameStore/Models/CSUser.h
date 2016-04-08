//
//  CSUser.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface CSUser : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong, readonly) NSString *email;
@property (nonatomic, strong, readonly) NSString *authToken;

@end
