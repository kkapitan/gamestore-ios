//
//  CSUploadUser.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

//Model
#import "CSUser.h"

@interface CSUploadUser : MTLModel

@property (nonatomic, assign, readonly) NSInteger uid;

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *nickname;

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSURL *avatarURL;

- (instancetype)initWithUser:(CSUser *)user;

@end