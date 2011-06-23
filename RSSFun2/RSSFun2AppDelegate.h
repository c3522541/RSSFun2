//
//  RSSFun2AppDelegate.h
//  RSSFun2
//
//  Created by Sean Che on 11-06-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
@interface RSSFun2AppDelegate : NSObject <UIApplicationDelegate> {
    RootViewController *viewController;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
