//
//  UIAlertController+Errors.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 09.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "UIAlertController+Errors.h"

@implementation UIAlertController (Errors)

+ (instancetype)alertControllerWithError:(NSError *)error {
    
    NSString *message = error.userInfo[@"message"] ?: @"An error occured!";
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:okAction];
    return alert;
}

@end
