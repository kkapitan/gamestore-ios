//
//  CSRequests.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRequests.h"

@implementation AFHTTPSessionManager (Requests)

- (NSMutableURLRequest *)requestLoginUserWithParams:(CSLoginUserParams *)params {
    return [self.requestSerializer requestWithMethod:@"POST"
                                           URLString:[NSString stringWithFormat:@"%@/sessions",self.baseURL]
                                          parameters:params.params
                                               error:nil];
}

@end
