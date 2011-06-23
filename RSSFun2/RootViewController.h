//
//  RootViewController.h
//  RSSFun
//
//  Created by Sean Che on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UITableViewController {
    NSMutableArray *_allEntries;
    NSOperationQueue *queue;
    NSArray *feeds;
}
@property (nonatomic, retain) NSMutableArray *_allEntries;
@property (nonatomic, retain) NSOperationQueue *queue;
@property (nonatomic, retain) NSArray *feed;

@end
