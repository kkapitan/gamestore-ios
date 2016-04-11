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
#import "CSShowUserParams.h"
#import "CSUpdateUserParams.h"
#import "CSShowGameParams.h"
#import "CSShowGamesParams.h"
#import "CSUpdateGameLibraryParams.h"
#import "CSPostReviewParams.h"

@interface AFHTTPSessionManager (Requests)

// Sessions requests

- (NSMutableURLRequest *)requestLoginUserWithParams:(CSLoginUserParams *)params;
- (NSMutableURLRequest *)requestRegisterUserWithParams:(CSRegisterUserParams *)params;
- (NSMutableURLRequest *)requestLogoutCurrentUser;

// Users requests

- (NSMutableURLRequest *)requestFetchUserWithParams:(CSShowUserParams *)params;
- (NSMutableURLRequest *)requestUpdateCurrentUserWithParams:(CSUpdateUserParams *)params;
- (NSMutableURLRequest *)requestDeleteCurrentUser;

// Games requests

- (NSMutableURLRequest *)requestFetchGamesWithParams:(CSShowGamesParams *)params;
- (NSMutableURLRequest *)requestFetchGameWithParams:(CSShowGameParams *)params;

// Library requests

- (NSMutableURLRequest *)requestUpdateGameLibraryWithParams:(CSUpdateGameLibraryParams *)params;

// Review requests

- (NSMutableURLRequest *)requestPostReviewWithParams:(CSPostReviewParams *)params;

// Other requests

@end
