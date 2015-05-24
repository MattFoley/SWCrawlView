//
//  ViewController.m
//  SWCrawlViewExample
//
//  Created by TJ Fallon on 5/21/15.
//  Copyright (c) 2015 TJ Fallon. All rights reserved.
//

#import "ViewController.h"
#import "SWCrawlView.h"
#import "SWCrawl.h"

@interface ViewController ()

@property (weak) IBOutlet SWCrawlView *crawlView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SWCrawl *crawl = [SWCrawl new];

    //Funny casing to use the characters in SW Jedi font that we need.
    [crawl setLogoText:@"Crawl\nWars"];

    [crawl setEpisodeNumberText:@"Episode 6+"];

    //Lowercase string because SW Title font has a couple funny characters in it. Check out the font.
    [crawl setEpisodeTitleText:@"Lorem Ipsum Strikes Back".lowercaseString];
    [crawl setBodyText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];

    [self.crawlView updateTextViaCrawl:crawl];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
