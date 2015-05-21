//
//  SWCrawl.h
//  CrawlCreator2.0
//
//  Created by Tj on 5/17/15.
//  Copyright (c) 2015 Tj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  This class exists to pass around data describing a Crawl object.
 */
@interface SWCrawl : NSObject

@property NSString *introText;
@property NSString *logoText;
@property NSString *episodeNumberText;
@property NSString *episodeTitleText;
@property NSString *bodyText;

@property UIFont *logoFont;
@property UIFont *episodeTitleFont;
@property UIFont *episodeNumberFont;
@property UIFont *bodyFont;

@property UIColor *logoStrokeColor;
@property UIColor *episodeTitleColor;
@property UIColor *episodeNumberColor;
@property UIColor *bodyColor;

- (NSAttributedString *)composedCrawlString;

@end
