//
//  RSSEntry.h
//  RSSFun
//
//  Created by Sean Che on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RSSEntry : NSObject {
    NSString *_blogTitle;
    NSString *_articleTitle;
    NSString *_articleUrl;
    NSDate *_articleDate;
}

@property (nonatomic, copy) NSString *_blogTitle;
@property (nonatomic, copy) NSString *_articleTitle;
@property (nonatomic, copy) NSString *_articleUrl;
@property (nonatomic, copy) NSDate *_articleDate;

- (id)initWithBlogTitle:(NSString*)blogTitle articleTitle:(NSString*)articleTitle articleUrl:(NSString*)articleUrl articleDate:(NSDate*)articleDate;

@end
