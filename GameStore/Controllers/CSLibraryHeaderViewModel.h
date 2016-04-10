//
//  CSLibraryHeaderViewModel.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Models
#import "CSUser.h"

@interface CSLibraryHeaderViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *userFullName;

- (instancetype)initWithUser:(CSUser *)user;

@end
