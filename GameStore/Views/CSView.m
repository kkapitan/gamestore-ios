//
//  CSView.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSView.h"

@implementation CSView

+ (instancetype)view {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class)
                                          owner:self
                                        options:nil] firstObject];
}

@end
