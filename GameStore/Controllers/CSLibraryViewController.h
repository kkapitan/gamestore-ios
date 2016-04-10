//
//  CSLibraryViewController.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 10.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

//Model
#import "CSUser.h"

@interface CSLibraryViewController : UITableViewController

@property (nonatomic, strong) CSUser *user;

@end
