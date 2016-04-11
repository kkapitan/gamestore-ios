//
//  CSShowUserParams.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRequestParamsProtocol.h"

@interface CSShowUserParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, assign, readonly) NSInteger userIdentifier;

- (instancetype)initWithUserIdentifier:(NSInteger)userIdentifier;

@end
