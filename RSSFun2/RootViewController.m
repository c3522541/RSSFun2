//
//  RootViewController.m
//  RSSFun
//
//  Created by Sean Che on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "RSSEntry.h"
#import "ASIHTTPRequest.h"

@implementation RootViewController
@synthesize _allEntries;
@synthesize feeds;
@synthesize queue;

- (void)refresh {
    for (NSString *feed in feeds)
    {
        NSURL *url = [NSURL URLWithString:feed];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        [request setDelegate:self];
        [queue addOperation:request];
    }
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    
    RSSEntry *entry = [[[RSSEntry alloc] initWithBlogTitle:request.url.absoluteString
                                              articleTitle:request.url.absoluteString
                                                articleUrl:request.url.absoluteString
                                               articleDate:[NSDate date]] autorelease];    
    int insertIdx = 0;                    
    [_allEntries insertObject:entry atIndex:insertIdx];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:insertIdx inSection:0]]
                          withRowAnimation:UITableViewRowAnimationRight];
    
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    NSLog(@"Error: %@", error);
}
- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)addRows
{
    RSSEntry *entry1 = [[[RSSEntry alloc] initWithBlogTitle:@"1" articleTitle:@"1" articleUrl:@"1" articleDate:[NSDate date]] autorelease];
    RSSEntry *entry2 = [[[RSSEntry alloc] initWithBlogTitle:@"2" articleTitle:@"2" articleUrl:@"2" articleDate:[NSDate date]] autorelease];
    RSSEntry *entry3 = [[[RSSEntry alloc] initWithBlogTitle:@"3" articleTitle:@"3" articleUrl:@"3" articleDate:[NSDate date]] autorelease];
    
    [_allEntries insertObject:entry1 atIndex:0];
    [_allEntries insertObject:entry2 atIndex:0];
    [_allEntries insertObject:entry3 atIndex:0];
}

- (void)dealloc
{
    [_allEntries release];
    _allEntries = nil;
    [feeds release];
    feeds = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    
    UIView *myView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    myView.autoresizesSubviews = YES;
    self.view = myView;
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
    tableView.editing = YES;
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    [tableView release];
    [myView release];
}


// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_allEntries count];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    self.title = @"Feeds";
    self._allEntries = [NSMutableArray array];
    self.queue = [[[NSOperationQueue alloc] init] autorelease];
    self.feeds = [NSArray arrayWithObjects:@"http://feeds.feedburner.com/RayWenderlich",
                  @"http://feeds.feedburner.com/vmwstudios",
                  @"http://idtypealittlefaster.blogspot.com/feeds/posts/default", 
                  @"http://www.71squared.com/feed/",
                  @"http://cocoawithlove.com/feeds/posts/default",
                  @"http://feeds2.feedburner.com/brandontreb",
                  @"http://feeds.feedburner.com/CoryWilesBlog",
                  @"http://geekanddad.wordpress.com/feed/",
                  @"http://iphonedevelopment.blogspot.com/feeds/posts/default",
                  @"http://karnakgames.com/wp/feed/",
                  @"http://kwigbo.com/rss",
                  @"http://shawnsbits.com/feed/",
                  @"http://pocketcyclone.com/feed/",
                  @"http://www.alexcurylo.com/blog/feed/",         
                  @"http://feeds.feedburner.com/maniacdev",
                  @"http://feeds.feedburner.com/macindie",
                  nil];    
    [self refresh];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    RSSEntry *entry = [_allEntries objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    NSString *articleDateString = [dateFormatter stringFromDate:entry._articleDate];
    
    cell.textLabel.text = entry._articleTitle;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", articleDateString, entry._blogTitle];
    
    return cell;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
