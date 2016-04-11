//
//  CSUpdateUserParams.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRequestParamsProtocol.h"

//Model
#import "CSUploadUser.h"

@interface CSUpdateUserParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, readonly, strong) CSUploadUser *user;

- (instancetype)initWithUser:(CSUploadUser *)user;

@end
