//
//  RSSEntry.m
//  RSSFun
//
//  Created by Sean Che on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSEntry.h"


@implementation RSSEntry
@synthesize _blogTitle;
@synthesize _articleTitle;
@synthesize _articleUrl;
@synthesize _articleDate;

-(id)initWithBlogTitle:(NSString*)blogTitle articleTitle:(NSString*)articleTitle articleUrl:(NSString*)articleUrl articleDate:(NSDate*)articleDate;
{
    if(self = [super init])
    {
        _blogTitle = [blogTitle copy];
        _articleTitle = [articleTitle copy];
        _articleUrl = [articleUrl copy];
        _articleDate = [articleDate copy];
    }
    return self;
}

-(void)dealloc
{
    [_blogTitle release];
    _blogTitle = nil;
    [_articleTitle release];
    _articleTitle = nil;
    [_articleUrl release];
    _articleUrl = nil;
    [_articleDate release];
    [super dealloc];
}
@end
