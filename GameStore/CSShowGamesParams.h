//
//  CSShowGamesParams.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 11.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRequestParamsProtocol.h"

//Model
#import "CSPage.h"
#import "CSSearchQuery.h"

@interface CSShowGamesParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, strong, readonly) CSPage *page;
@property (nonatomic, strong, readonly) CSSearchQuery *query;

- (instancetype)initWithQuery:(CSSearchQuery *)query page:(CSPage *)page;

@end
