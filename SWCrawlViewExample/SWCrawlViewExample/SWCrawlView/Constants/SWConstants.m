//
//  SWConstants.m
//  CrawlCreator2.0
//
//  Created by Tj on 5/16/15.
//  Copyright (c) 2015 Tj. All rights reserved.
//

#import "SWConstants.h"

@implementation SWConstants

UIColor* UIColorFromRGB(unsigned int rgbValue) {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0
                           green:((float)((rgbValue & 0xFF00) >> 8))/255.0
                            blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}


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
