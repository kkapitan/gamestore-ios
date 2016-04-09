//
//  CSSignInViewModel.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 09.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CSSignInViewModelCompletionBlock)(BOOL success, UIAlertController *alert);

@interface CSSignInViewModel : NSObject

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;

- (void)signInWithCompletion:(CSSignInViewModelCompletionBlock)block;

@end
