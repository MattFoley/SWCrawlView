//
//  MFLCrawlView.h
//  CrawlCreator2.0
//
//  Created by Tj on 5/16/15.
//  Copyright (c) 2015 Tj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWCrawl.h"

//I know, it should really have a three letter class prefix, but I couldn't resist.
@interface SWCrawlView : UIView

#pragma mark Text Customization
/**
 *  e.g.:
 *               STAR
 *               WARS
 *
 *  @param logoText Use new lines, it will not line break automatically. Will respect logoStrokeColor/Font, will always fill black.
 */
- (void)setLogoText:(NSString *)logoText;

/**
 * e.g.:
 *                 Episode V
 *
 *  @param numberText Number text to be set, can be nil. Will respect episodeNumberFont/Color
 */
- (void)setEpisodeNumberText:(NSString *)numberText;

/**
 *  e.g.:
 *          THE EMPIRE STRIKES BACK
 *
 *  @param titleText Title text to be set, can be nil. Will respect episodeTitleFont/Color
 */
- (void)setEpisodeTitleText:(NSString *)titleText;

/**
 *  e.g.:
 *
 *          It  is  a  dark  time for  the
 *          Rebellion.  Although the Death
 *          Star   has   been    destroyed.
 *
 *  @param bodyText Text will be justified and broken into lines for you. Will respect bodyTextFont/Color
 */
- (void)setBodyText:(NSString *)bodyText;

#pragma Update via SWCrawl
/**
 *  You can set all cusotmization values by creating an SWCrawl object and passing it in here.
 *  Text values which are nil will be used, but font and color values which are nil will be ignored in favor of currently set values.
 *
 *  @param crawl Customized SWCrawl object.
 */
- (void)updateTextViaCrawl:(SWCrawl *)crawl;


/**
 *  This method will return a SWCrawl object with all the current properties of the view set.
 *
 *  @return Customized SWCrawl object
 */
- (SWCrawl *)crawlForCurrentText;


/**
 *  This will return an NSAttributedString of the episode number, episode title, and crawl body merged together.
 *  This string is used internally to display the crawl.
 *
 *  @return Crawl string, including all text style customizations.
 */
- (NSAttributedString *)composedCrawlString;

#pragma mark Font/Color Customization

/**
 *  See above text comments for descriptions of each value in the crawl. Setting any of these will update the  force a redraw on the crawl view.
 */
@property (nonatomic) UIFont *logoFont;
@property (nonatomic) UIFont *episodeTitleFont;
@property (nonatomic) UIFont *episodeNumberFont;
@property (nonatomic) UIFont *bodyFont;

@property (nonatomic) UIColor *logoStrokeColor;
@property (nonatomic) UIColor *episodeTitleColor;
@property (nonatomic) UIColor *episodeNumberColor;
@property (nonatomic) UIColor *bodyColor;

@property (readonly) BOOL isAnimating;

- (void)redisplayAfterScrollOut;
- (void)scrollOutWithDuration:(CGFloat)duration
                   completion:(void(^)(void))completion;

@end
