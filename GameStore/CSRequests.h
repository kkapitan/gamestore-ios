//
//  CSRequests.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

//Params
#import "CSLoginUserParams.h"
#import "CSRegisterUserParams.h"

@interface AFHTTPSessionManager (Requests)

// Session requests

- (NSMutableURLRequest *)requestLoginUserWithParams:(CSLoginUserParams *)params;
- (NSMutableURLRequest *)requestRegisterUserWithParams:(CSRegisterUserParams *)params;
- (NSMutableURLRequest *)requestLogoutCurrentUser;

@end
