//
//  CSAppDelegate.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 4/8/16
//  Copyright (c) 2014 Cappsoft. All rights reserved.
//

#import "CSAppDelegate.h"
#import "CSEnvironment.h"

@implementation CSAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%@",[[CSEnvironment sharedConfiguration] apiBaseURL]);
    return YES;
}


@end
