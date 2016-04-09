//
//  Validation.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 09.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

- (BOOL)isValidPassword:(NSError *__autoreleasing *)error {
    
    BOOL lengthValid = self.length >= 8;
    if (!lengthValid && error) {
        *error = [self errorWithMessage:@"Password should have at least 8 characters"];
    }
    
    BOOL charactersValid = [self rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]].location == NSNotFound;
    if (!charactersValid && error) {
        *error = [self errorWithMessage:@"Password contains illegal characters"];
    }
    
    return lengthValid && charactersValid;
}


- (BOOL)isValidEmail:(NSError *__autoreleasing *)error {
    NSString *emailRegexp = @"^.+@.+\\..{2,}$";
    BOOL emailValid = [self rangeOfString:emailRegexp options:NSRegularExpressionSearch].location != NSNotFound;
        
    if (!emailValid && error) {
        *error = [self errorWithMessage:@"Email is invalid"];
    }

    return emailValid;
}

- (BOOL)isValidPasswordConfirmation:(NSString *)password error:(NSError *__autoreleasing *)error {
    BOOL validConfirmation = [self isEqualToString:password];
    
    if (!validConfirmation && error) {
        *error = [self errorWithMessage:@"Passwords do not match"];
    }
    
    return validConfirmation;
}

#pragma mark -
#pragma mark - Private

- (NSError *)errorWithMessage:(NSString *)message {
    return [NSError errorWithDomain:kCSErrorDomain code:500
                           userInfo:@{ @"message": message }];

}

@end
