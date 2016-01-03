//
//  SWConstants.m
//  CrawlCreator2.0
//
//  Created by Tj on 5/16/15.
//  Copyright (c) 2015 Tj. All rights reserved.
//

#import "SWConstants.h"

@implementation SWConstants

+ (BOOL)color:(UIColor *)color1 matchesColor:(UIColor *)color2
{
    CGFloat red1, red2, green1, green2, blue1, blue2, alpha1, alpha2;
    [color1 getRed:&red1 green:&green1 blue:&blue1 alpha:&alpha1];
    [color2 getRed:&red2 green:&green2 blue:&blue2 alpha:&alpha2];

    return (ceil(red1 * 1000.0) / 1000.0 == ceil(red2 * 1000.0) / 1000.0 &&
            ceil(green1 * 1000.0) / 1000.0 == ceil(green2 * 1000.0) / 1000.0 &&
            ceil(blue1 * 1000.0) / 1000.0 == ceil(blue2 * 1000.0) / 1000.0 &&
            ceil(alpha1 * 1000.0) / 1000.0 == ceil(alpha2 * 1000.0) / 1000.0);
}

+ (NSArray *)randomSaberColorList
{

    NSMutableArray *randomList = [@[UIColorFromRGB(0x229ed3),
                                   UIColorFromRGB(0x9c3e9a),
                                   UIColorFromRGB(0x008e45),
                                   UIColorFromRGB(0xe3171f)] mutableCopy];

    NSUInteger count = [randomList count];
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [randomList exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }

    return randomList;
}

+ (UIColor *)randomSaberColor
{
    switch (arc4random()%4) {
        default:
        case 0: return UIColorFromRGB(0x229ed3);
        case 1: return UIColorFromRGB(0x9c3e9a);
        case 2: return UIColorFromRGB(0x008e45);
        case 3: return UIColorFromRGB(0xe3171f);
    }
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

+ (UIColor *)introBackgroundColor
{
    return [UIColor blackColor];
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
