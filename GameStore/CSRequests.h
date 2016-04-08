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

@interface AFHTTPSessionManager (Requests)

- (NSMutableURLRequest *)requestLoginUserWithParams:(CSLoginUserParams *)params;

@end
