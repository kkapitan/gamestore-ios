//
//  CSRegisterUserParams.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRequestParamsProtocol.h"

@interface CSRegisterUserParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, readonly, strong) NSString *email;

@property (nonatomic, readonly, strong) NSString *password;
@property (nonatomic, readonly, strong) NSString *passwordConfirmation;

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password confirmation:(NSString *)passwordConfirmation;


@end
