//
//  CSLoginUserParams.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRequestParamsProtocol.h"

@interface CSLoginUserParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, strong, readonly) NSString *password;
@property (nonatomic, strong, readonly) NSString *email;

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password;

@end
