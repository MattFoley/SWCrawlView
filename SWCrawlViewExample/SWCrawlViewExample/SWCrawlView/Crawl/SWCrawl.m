//
//  SWCrawl.m
//  CrawlCreator2.0
//
//  Created by Tj on 5/17/15.
//  Copyright (c) 2015 Tj. All rights reserved.
//

#import "SWCrawl.h"
#import <UIKit/UIKit.h>
#import "SWConstants.h"

@implementation SWCrawl

+ (SWCrawl *)defaultCrawl
{
    SWCrawl *crawl = [SWCrawl new];

    crawl.logoStrokeColor = [SWConstants starWarsLogoColor];
    crawl.episodeNumberColor = [SWConstants crawlTextColor];
    crawl.episodeTitleColor = [SWConstants crawlTextColor];
    crawl.bodyColor = [SWConstants crawlTextColor];
    crawl.introTextColor = [SWConstants introTextColor];
    crawl.introBackgroundColor = [SWConstants introBackgroundColor];
    crawl.introFont = [SWConstants introTextFont:20];
    crawl.logoFont = [SWConstants starWarsLogoFont:UIInterfaceIdiomIsPad() ? 140 : 48];
    crawl.episodeNumberFont = [SWConstants episodeNumberFont:20];
    crawl.episodeTitleFont = [SWConstants episodeTitleFont:40];
    crawl.bodyFont = [SWConstants bodyTextFont:20];

    return crawl;
}

- (id)copyWithZone:(NSZone *)zone
{
    SWCrawl *newCrawl = [[[self class] allocWithZone:zone] init];

    if (newCrawl) {
        newCrawl.introText = self.introText;
        newCrawl.logoText = self.logoText;
        newCrawl.episodeNumberText = self.episodeNumberText;
        newCrawl.episodeTitleText = self.episodeTitleText;
        newCrawl.bodyText = self.bodyText;

        newCrawl.introFont = self.introFont;
        newCrawl.logoFont = self.logoFont;
        newCrawl.episodeTitleFont = self.episodeTitleFont;
        newCrawl.episodeNumberFont = self.episodeNumberFont;
        newCrawl.bodyFont = self.bodyFont;


        newCrawl.introTextColor = self.introTextColor;
        newCrawl.logoStrokeColor = self.logoStrokeColor;
        newCrawl.episodeTitleColor = self.episodeTitleColor;
        newCrawl.episodeNumberColor = self.episodeNumberColor;
        newCrawl.bodyColor = self.bodyColor;

        newCrawl.introBackgroundColor = self.introBackgroundColor;
    }

    return newCrawl;
}


- (NSAttributedString *)composedCrawlString
{
    NSMutableAttributedString *fullCrawlString = [NSMutableAttributedString new];

    if (self.episodeNumberText.length) {
        NSMutableParagraphStyle *numberTextParagraphStyle = [NSMutableParagraphStyle new];
        numberTextParagraphStyle.alignment = NSTextAlignmentCenter;

        NSDictionary *numberAttributes = @{ NSParagraphStyleAttributeName : numberTextParagraphStyle,
                                            NSForegroundColorAttributeName : self.episodeNumberColor,
                                            NSFontAttributeName : self.episodeNumberFont};

        NSString *spacedNumberString = [NSString stringWithFormat:@"%@\n\n", self.episodeNumberText];
        NSAttributedString *numberString = [[NSAttributedString alloc] initWithString:spacedNumberString
                                                                           attributes:numberAttributes];

        [fullCrawlString appendAttributedString:numberString];
    }

    if (self.episodeTitleText.length) {
        NSMutableParagraphStyle *titleTextParagraphStyle = [NSMutableParagraphStyle new];
        titleTextParagraphStyle.alignment = NSTextAlignmentCenter;

        NSDictionary *titleAttributes = @{ NSParagraphStyleAttributeName : titleTextParagraphStyle,
                                           NSForegroundColorAttributeName : self.episodeTitleColor,
                                           NSFontAttributeName : self.episodeTitleFont};
        NSString *spacedTitleString = [NSString stringWithFormat:@"%@\n\n", self.episodeTitleText];
        NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:spacedTitleString
                                                                          attributes:titleAttributes];

        [fullCrawlString appendAttributedString:titleString];
    }

    if (self.bodyText.length) {
        NSMutableParagraphStyle *bodyTextParagraphStyle = [NSMutableParagraphStyle new];
        bodyTextParagraphStyle.alignment = NSTextAlignmentJustified;
        bodyTextParagraphStyle.firstLineHeadIndent = 0.05;    // "Very IMP" said original comment, why? Tj-

        NSDictionary *bodyAttributes = @{ NSParagraphStyleAttributeName : bodyTextParagraphStyle,
                                          NSForegroundColorAttributeName : self.bodyColor,
                                          NSFontAttributeName : self.bodyFont };

        NSAttributedString *bodyString = [[NSAttributedString alloc] initWithString:self.bodyText
                                                                         attributes:bodyAttributes];
        [fullCrawlString appendAttributedString:bodyString];
    }
    
    return fullCrawlString;
}

@end
