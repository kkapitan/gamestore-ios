//
//  Validation.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 09.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)

- (BOOL)isValidPassword:(NSError **)error;
- (BOOL)isValidEmail:(NSError **)error;
- (BOOL)isValidPasswordConfirmation:(NSString *)password error:(NSError **)error;
@end
