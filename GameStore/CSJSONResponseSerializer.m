//
//  CSJSONResponseSerializer.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSJSONResponseSerializer.h"

@implementation CSJSONResponseSerializer

- (instancetype)init {
    self = [super init];
    if (self) {
        // extend acceptable content types
        NSSet *set = [self.acceptableContentTypes setByAddingObject:@"application/json"];
        [self setAcceptableContentTypes:set];
        
        // set acceptable content code returned by API
        NSMutableIndexSet *statusCodesSet = [self.acceptableStatusCodes mutableCopy];
        [statusCodesSet addIndex:422];
        [self setAcceptableStatusCodes:[statusCodesSet copy]];
    }
    
    return self;
}


- (id)responseObjectForResponse:(NSHTTPURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error {
    // get parsed JSON response
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    
    // default validation
    if (![self validateResponse:response data:data error:NULL]) {
        return nil;
    }
    
    NSError* (^parseErrorResponse)(NSDictionary *) = ^NSError *(NSDictionary *payload) {
        NSMutableDictionary *errorHash = [json mutableCopy];
        errorHash[@"code"] = @(response.statusCode);
        
        // create model object form JSON
        NSError *adapterError = nil;
        CSError *errorObject = [MTLJSONAdapter modelOfClass:CSError.class
                                         fromJSONDictionary:errorHash[@"error"][@"error"]
                                                      error:&adapterError];
        
        // returns error
        return adapterError ? adapterError : errorObject.error;
    };
    
    // handle forbidden reponse
    if (response.statusCode == 400 || response.statusCode == 401 || response.statusCode == 403 || response.statusCode == 422) {
        if (error != NULL) *error = parseErrorResponse(json);
        return nil;
    }
    
    
    return json;
}

@end
