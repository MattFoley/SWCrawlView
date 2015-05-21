//
//  SWCrawl.m
//  CrawlCreator2.0
//
//  Created by Tj on 5/17/15.
//  Copyright (c) 2015 Tj. All rights reserved.
//

#import "SWCrawl.h"
#import <UIKit/UIKit.h>

@implementation SWCrawl

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
