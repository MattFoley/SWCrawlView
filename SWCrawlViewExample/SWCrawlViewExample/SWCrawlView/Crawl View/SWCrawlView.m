//
//  MFLCrawlView.m
//  CrawlCreator2.0
//
//  Created by Tj on 5/16/15.
//  Copyright (c) 2015 Tj. All rights reserved.
//

#import "SWCrawlView.h"
#import "SWConstants.h"
#import "SWStrokedLogoLabel.h"
#import <UIKit/UIKit.h>

#ifndef UIInterfaceIdiomIsPad
#define UIInterfaceIdiomIsPad() (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#endif

const CGFloat logoStrokeSizeForFontPointSizeMultiplier = .165;

@interface SWCrawlView () <UIScrollViewDelegate>

@property (weak) IBOutlet UIView *xibView;
@property (weak) IBOutlet UIView *screenSizeScaleView;

@property (weak) IBOutlet UIImageView *maskImageView;
@property (weak) IBOutlet UIScrollView *scrollView;
@property (weak) IBOutlet UIScrollView *controlView;

@property (weak) IBOutlet UILabel *crawlTextView;
@property (weak) IBOutlet NSLayoutConstraint *crawlTextTopSpacingConstraint;
@property (weak) IBOutlet NSLayoutConstraint *crawlTextBottomSpacingConstraint;

@property (weak) IBOutlet SWStrokedLogoLabel *logoLabel;
@property (weak) IBOutlet NSLayoutConstraint *logoWidthConstraint;
@property (weak) IBOutlet NSLayoutConstraint *logoHeightConstraint;
@property (weak) IBOutlet UILabel *titleLabel;

@property (readwrite) BOOL isAnimating;

@property SWCrawl *crawl;

@end

@implementation SWCrawlView

#pragma mark Init
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self sharedInit];
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self sharedInit];
    }

    return self;
}

- (void)sharedInit
{
    _crawl = [SWCrawl new];

    _crawl.logoStrokeColor = [SWConstants starWarsLogoColor];
    _crawl.episodeNumberColor = [SWConstants crawlTextColor];
    _crawl.episodeTitleColor = [SWConstants crawlTextColor];
    _crawl.bodyColor = [SWConstants crawlTextColor];

    _crawl.logoFont = [SWConstants starWarsLogoFont:UIInterfaceIdiomIsPad() ? 140 : 48];
    _crawl.episodeNumberFont = [SWConstants episodeNumberFont:20];
    _crawl.episodeTitleFont = [SWConstants episodeTitleFont:40];
    _crawl.bodyFont = [SWConstants bodyTextFont:20];

    [self unwrapNib];

    [self startObservingScrollChanges];
    [self beginOrientationObserving];

    [self orientationDidChange:nil];
}

- (void)unwrapNib
{
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class)
                                  owner:self
                                options:nil];

    [self.xibView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.xibView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"starBg.png"]]];
    [self addSubview:self.xibView];

    NSDictionary *views = NSDictionaryOfVariableBindings(_xibView);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_xibView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_xibView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
}

#pragma mark Customization

- (void)updateTextViaCrawl:(SWCrawl *)crawl
{
    [self setLogoText:crawl.logoText];
    [self setLogoFont:crawl.logoFont];
    [self setLogoStrokeColor:crawl.logoStrokeColor];

    [self setEpisodeNumberText:crawl.episodeNumberText];
    [self setEpisodeNumberFont:crawl.episodeNumberFont];
    [self setEpisodeNumberColor:crawl.episodeNumberColor];

    [self setEpisodeTitleText:crawl.episodeTitleText];
    [self setEpisodeTitleColor:crawl.episodeTitleColor];
    [self setEpisodeTitleFont:crawl.episodeTitleFont];

    [self setBodyText:crawl.bodyText];
    [self setBodyColor:crawl.bodyColor];
    [self setBodyFont:crawl.bodyFont];
}

- (SWCrawl *)crawlForCurrentText
{
    return self.crawl;
}

- (NSAttributedString *)composedCrawlString
{
    return [self.crawl composedCrawlString];
}

- (void)updateCrawlingText
{
    [self.crawlTextView setAttributedText:[self composedCrawlString]];

    [self setNeedsUpdateConstraints];
    [self layoutIfNeeded];

    [self scrollViewDidScroll:self.scrollView];
}

#pragma mark Setters

- (void)setEpisodeNumberText:(NSString *)numberText
{
    self.crawl.episodeNumberText = numberText;
    [self updateCrawlingText];
}

- (void)setEpisodeTitleText:(NSString *)titleText
{
    self.crawl.episodeTitleText = titleText;
    [self updateCrawlingText];
}

- (void)setBodyText:(NSString *)bodyText
{
    self.crawl.bodyText = bodyText;
    [self updateCrawlingText];
}

- (void)setLogoText:(NSString *)logoText
{
    [self.logoLabel setStrokeColor:self.crawl.logoStrokeColor];
    [self.logoLabel setFont:self.crawl.logoFont];
    [self.logoLabel setText:logoText];
    [self.logoLabel setStrokeWidth:self.crawl.logoFont.pointSize * logoStrokeSizeForFontPointSizeMultiplier];
    [self.crawl setLogoText:logoText];
}

- (void)setLogoFont:(UIFont *)logoFont
{
    if (logoFont) {
        _logoFont = logoFont;

        self.crawl.logoFont = logoFont;
        [self updateCrawlingText];
    }
}

- (void)setBodyFont:(UIFont *)bodyFont
{
    if (bodyFont) {
        _bodyFont = bodyFont;

        self.crawl.bodyFont = bodyFont;
        [self updateCrawlingText];
    }
}

- (void)setEpisodeTitleFont:(UIFont *)episodeTitleFont
{
    if (episodeTitleFont) {
        _episodeTitleFont = episodeTitleFont;

        self.crawl.episodeTitleFont = episodeTitleFont;
        [self updateCrawlingText];
    }
}

- (void)setEpisodeNumberFont:(UIFont *)episodeNumberFont
{
    if (episodeNumberFont) {
        _episodeNumberFont = episodeNumberFont;

        self.crawl.episodeNumberFont = episodeNumberFont;
        [self updateCrawlingText];
    }
}

- (void)setLogoStrokeColor:(UIColor *)logoStrokeColor
{
    if (logoStrokeColor) {
        _logoStrokeColor = logoStrokeColor;

        self.crawl.logoStrokeColor = logoStrokeColor;
        [self updateCrawlingText];
    }
}

- (void)setBodyColor:(UIColor *)bodyColor
{
    if (bodyColor) {
        _bodyColor = bodyColor;

        self.crawl.bodyColor = bodyColor;
        [self updateCrawlingText];
    }
}

- (void)setEpisodeTitleColor:(UIColor *)episodeTitleColor
{
    if (episodeTitleColor) {
        _episodeTitleColor = episodeTitleColor;

        self.crawl.episodeTitleColor = episodeTitleColor;
        [self updateCrawlingText];
    }
}

- (void)setEpisodeNumberColor:(UIColor *)episodeNumberColor
{
    if (episodeNumberColor) {
        _episodeNumberColor = episodeNumberColor;

        self.crawl.episodeNumberColor = episodeNumberColor;
        [self updateCrawlingText];
    }
}

#pragma mark Scroll Handling

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!self.isAnimating) {
        CGFloat distanceFromVisible = (scrollView.contentOffset.y * 2) + CGRectGetHeight(self.frame);
        CGFloat logoScaleTransformValue = (1.0 - (distanceFromVisible / self.crawlTextTopSpacingConstraint.constant)) *
        [self logoScaleForScreenSize];

        [self.logoLabel setHidden:(logoScaleTransformValue <= 0)];

        if (logoScaleTransformValue > 0) {
            CGAffineTransform scaleTransform = CGAffineTransformMakeScale(logoScaleTransformValue,
                                                                          logoScaleTransformValue);

            [self.logoLabel setTransform:scaleTransform];
        }
    }
}

static int kObservingContentSizeChangesContext;
static int kObservingContentOffsetChangesContext;

- (void)startObservingScrollChanges
{
    [self.scrollView addObserver:self
                      forKeyPath:@"contentSize"
                         options:0
                         context:&kObservingContentSizeChangesContext];
    [self.controlView addObserver:self
                       forKeyPath:@"contentOffset"
                          options:0
                          context:&kObservingContentOffsetChangesContext];
}

- (void)stopObservingScrollChanges
{
    [self.controlView removeObserver:self
                          forKeyPath:@"contentOffset"
                             context:&kObservingContentOffsetChangesContext];

    [self.scrollView removeObserver:self
                         forKeyPath:@"contentSize"
                            context:&kObservingContentSizeChangesContext];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    UIScrollView *scrollView = object;
    if (context == &kObservingContentSizeChangesContext) {
        [self.controlView setContentSize:scrollView.contentSize];
    } else if (context == &kObservingContentOffsetChangesContext) {
        [self.scrollView setContentOffset:scrollView.contentOffset animated:NO];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark Orientation Handling

- (void)beginOrientationObserving
{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orientationDidChange:(id)sender
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];

    if (UIInterfaceOrientationIsLandscape(orientation)) {
        [self setupTransformsForLandscape];
    } else {
        [self setupTranformsForPortrait];
    }
}


//These transforms, which modify the m34, are how we acheive the perspective effect.
//I was never very good at matrix math, so that's the best explanation I have.

//This transform is not as movie accurate, but is more readable for portrait.
- (void)setupTranformsForPortrait
{
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
    rotationAndPerspectiveTransform.m34 = 1.0 / -550;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform,
                                                          80.0f * M_PI / 165.0f, 1.0f, 0.0f, 0.0f);
    rotationAndPerspectiveTransform = CATransform3DScale(rotationAndPerspectiveTransform, [self crawlScaleforScreenSize],
                                                         [self crawlScaleforScreenSize], 1);
    rotationAndPerspectiveTransform = CATransform3DTranslate(rotationAndPerspectiveTransform, 0, 0, -250);

    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath: @"transform"];
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:[((CALayer *)self.scrollView.layer.presentationLayer) transform]];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:rotationAndPerspectiveTransform];
    transformAnimation.duration = 3;
    [self.scrollView.layer addAnimation:transformAnimation forKey:@"transform"];
    [self.scrollView.layer setTransform:rotationAndPerspectiveTransform];

    [self.logoLabel.layer setZPosition:1000];
    [self.maskImageView.layer setZPosition:1000];
}

//This transform more accurately reflects the movie's angle.
- (void)setupTransformsForLandscape
{
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
    rotationAndPerspectiveTransform.m34 = 1.0 / -700;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform,
                                                          80.0f * M_PI / 155.0f, 1.0f, 0.0f, 0.0f);
    rotationAndPerspectiveTransform = CATransform3DScale(rotationAndPerspectiveTransform, [self crawlScaleforScreenSize],
                                                         [self crawlScaleforScreenSize], 1);
    rotationAndPerspectiveTransform = CATransform3DTranslate(rotationAndPerspectiveTransform, 0, 0, -250);

    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath: @"transform"];
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:[((CALayer *)self.scrollView.layer.presentationLayer) transform]];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:rotationAndPerspectiveTransform];
    transformAnimation.duration = 3;
    [self.scrollView.layer addAnimation:transformAnimation forKey:@"transform"];
    [self.scrollView.layer setTransform:rotationAndPerspectiveTransform];

    [self.logoLabel.layer setZPosition:1000];
    [self.maskImageView.layer setZPosition:1000];
}

#pragma mark Device Specific Tweaks

- (CGFloat)crawlScaleforScreenSize
{
    CGFloat scaleSize = 1;
    if (UIInterfaceIdiomIsPad()) {
        scaleSize = 1.4;
    } else {
        scaleSize = 1;
    }

    return scaleSize;
}

- (CGFloat)logoScaleForScreenSize
{
    CGFloat scaleSize;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        scaleSize = UIInterfaceIdiomIsPad() ? 2.0 : 2.0;
    } else {
        scaleSize = UIInterfaceIdiomIsPad() ? 3.0 : 2.5;
    }
    return scaleSize;
}

- (void)redisplayAfterScrollOut
{
    [UIView animateWithDuration:1.0 animations:^{
        [self.scrollView setAlpha:1];
        [self.logoLabel setAlpha:1];
        [self.controlView setContentOffset:CGPointMake(0, 0)];
    }];
}

- (void)scrollOutWithDuration:(CGFloat)duration
                   completion:(void(^)(void))completion;
{
    self.isAnimating = YES;
    CGFloat delay = 0.0;
    CGFloat visibleTextOffset = (self.crawlTextTopSpacingConstraint.constant - CGRectGetHeight(self.bounds));
    if (self.scrollView.contentOffset.y < visibleTextOffset) {
        CGFloat distanceToGo = visibleTextOffset - self.scrollView.contentOffset.y;
        CGFloat percentageOfWholeDistance = distanceToGo / self.scrollView.contentSize.height;
        delay = duration * percentageOfWholeDistance;

        [UIView animateWithDuration:delay animations:^{
            [self.logoLabel setTransform:CGAffineTransformMakeScale(.001, .001)];
        }];
    }

    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.controlView setContentOffset:CGPointMake(0, (self.controlView.contentSize.height))];
                     } completion:^(BOOL finished) {
                         if (completion) {
                             completion();
                         }
                         self.isAnimating = NO;
                         [self.scrollView setAlpha:0];
                         [self.logoLabel setAlpha:0];
                     }];
}

@end
