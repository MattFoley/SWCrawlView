//
//  SWConstants.m
//  CrawlCreator2.0
//
//  Created by Tj on 5/16/15.
//  Copyright (c) 2015 Tj. All rights reserved.
//

#import "SWConstants.h"

@implementation SWConstants

+ (UIColor *)starWarsLogoColor
{
    return UIColorFromRGB(0xe5b13a);
}

+ (UIFont *)starWarsLogoFont:(NSInteger)size
{
    return [UIFont fontWithName:@"StarJedi" size:size];
}

+ (UIColor *)introTextColor
{
    return UIColorFromRGB(0x4bd5ee);
}

+ (UIFont *)introTextFont:(NSInteger)size
{
    return [UIFont fontWithName:@"Franklin Gothic Book" size:size];
}

+ (UIColor *)crawlTextColor
{
    return UIColorFromRGB(0xe5b13a);
}

+ (UIFont *)bodyTextFont:(NSInteger)size
{
    return [UIFont fontWithName:@"SW Crawl Body" size:size];
}

+ (UIFont *)episodeTitleFont:(NSInteger)size
{
    return [UIFont fontWithName:@"SW Crawl Title" size:size];
}

+ (UIFont *)episodeNumberFont:(NSInteger)size
{
    return [UIFont fontWithName:@"SW Crawl Body" size:size];
}

@end
