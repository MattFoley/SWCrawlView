//
//  SWConstants.h
//  CrawlCreator2.0
//
//  Created by Tj on 5/16/15.
//  Copyright (c) 2015 Tj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  These constants are designed to look as close to the theatrical Crawls as possible, using free to use fonts.
 *  Improvements could be made by purchasing a mobile license to the Franklin Gothic Demi family, as is specified here:
 *  http://www.theforce.net/fanfilms/postproduction/crawl/opening.asp
 *
 *  Also, the StarJedi font that's being used seems to have some glyph sizing issues. 
 *  I've attempted to modify the font file to clean it up, but you may notice it act strangely.
 */

@interface SWConstants : NSObject

UIColor* UIColorFromRGB(unsigned int rgbValue) ;

+ (UIColor *)starWarsLogoColor;
+ (UIFont *)starWarsLogoFont:(NSInteger)size;

+ (UIColor *)introTextColor;
+ (UIFont *)introTextFont:(NSInteger)size;

+ (UIColor *)crawlTextColor;

+ (UIFont *)bodyTextFont:(NSInteger)size;
+ (UIFont *)episodeTitleFont:(NSInteger)size;
+ (UIFont *)episodeNumberFont:(NSInteger)size;

@end
