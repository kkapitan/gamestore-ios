//
//  CSRequests.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRequests.h"

@implementation AFHTTPSessionManager (Requests)

#pragma mark -
#pragma mark - Sessions

- (NSMutableURLRequest *)requestLoginUserWithParams:(CSLoginUserParams *)params {
    return [self.requestSerializer requestWithMethod:@"POST"
                                           URLString:[NSString stringWithFormat:@"%@/sessions",self.baseURL]
                                          parameters:params.params
                                               error:nil];
}

- (NSMutableURLRequest *)requestRegisterUserWithParams:(CSRegisterUserParams *)params {
    return [self.requestSerializer requestWithMethod:@"POST"
                                           URLString:[NSString stringWithFormat:@"%@/users",self.baseURL]
                                          parameters:params.params
                                               error:nil];
}

- (NSMutableURLRequest *)requestLogoutCurrentUser {
    return [self.requestSerializer requestWithMethod:@"DELETE"
                                           URLString:[NSString stringWithFormat:@"%@/sessions/logout",self.baseURL]
                                          parameters:nil
                                               error:nil];
}

#pragma mark -
#pragma mark - Users

- (NSMutableURLRequest *)requestFetchUserWithParams:(CSShowUserParams *)params {
    return [self.requestSerializer requestWithMethod:@"GET"
                                           URLString:[NSString stringWithFormat:@"%@/users/%d",self.baseURL,params.userIdentifier]
                                          parameters:nil
                                               error:nil];
}

- (NSMutableURLRequest *)requestUpdateCurrentUserWithParams:(CSUpdateUserParams *)params {
    return [self.requestSerializer requestWithMethod:@"PUT"
                                           URLString:[NSString stringWithFormat:@"%@/users/%d",self.baseURL,params.user.uid]
                                          parameters:params.params
                                               error:nil];

}

- (NSMutableURLRequest *)requestDeleteCurrentUser {
    return [self.requestSerializer requestWithMethod:@"DELETE"
                                           URLString:[NSString stringWithFormat:@"%@/users",self.baseURL]
                                          parameters:nil
                                               error:nil];
}

#pragma mark -
#pragma mark - Library

- (NSMutableURLRequest *)requestUpdateGameLibraryWithParams:(CSUpdateGameLibraryParams *)params {
    return [self.requestSerializer requestWithMethod:@"PUT"
                                           URLString:[NSString stringWithFormat:@"%@/libraries/add",self.baseURL]
                                          parameters:params.params
                                               error:nil];
}

#pragma mark -
#pragma mark - Reviews

- (NSMutableURLRequest *)requestPostReviewWithParams:(CSPostReviewParams *)params {
    return [self.requestSerializer requestWithMethod:@"POST"
                                           URLString:[NSString stringWithFormat:@"%@/reviews",self.baseURL]
                                          parameters:params.params
                                               error:nil];

}

#pragma mark -
#pragma mark - Games

- (NSMutableURLRequest *)requestFetchGamesWithParams:(CSShowGamesParams *)params {
    return [self.requestSerializer requestWithMethod:@"GET"
                                        URLString:[NSString stringWithFormat:@"%@/games",self.baseURL]
                                       parameters:params.params
                                            error:nil];
}

- (NSMutableURLRequest *)requestFetchGameWithParams:(CSShowGameParams *)params {
    return [self.requestSerializer requestWithMethod:@"GET"
                                           URLString:[NSString stringWithFormat:@"%@/games/%d",self.baseURL,params.gameIdentifier]
                                          parameters:nil
                                               error:nil];
}

#pragma mark -
#pragma mark - Other

@end
