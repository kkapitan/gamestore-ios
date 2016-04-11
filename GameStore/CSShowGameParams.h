//
//  CSShowGameParams.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRequestParamsProtocol.h"

@interface CSShowGameParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, readonly, assign) NSInteger gameIdentifier;

- (instancetype)initWithGameIdentifier:(NSInteger)identifier;

@end
