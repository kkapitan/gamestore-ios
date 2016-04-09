//
//  UIAlertController+Errors.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 09.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIAlertController (Errors)

+ (instancetype)alertControllerWithError:(NSError *)error;

@end
