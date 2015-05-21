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
    [crawl setLogoText:@"STaR\nwaRS"];

    [crawl setEpisodeNumberText:@"Episode V"];

    //Lowercase string because SW Title font has a couple funny characters in it. Check out the font.
    [crawl setEpisodeTitleText:@"THE EMPIRE STRIKES BACK".lowercaseString];
    [crawl setBodyText:@"It is a dark time for the "
     "Rebellion. Although the Death "
     "Star has been destroyed, "
     "Imperial troops have driven the "
     "Rebel forces from their hidden "
     "base and pursued them across "
     "the galaxy.\n\n"
     "Evading the dreaded Imperial "
     "Starfleet, a group of freedom "
     "fighters led by Luke Skywalker "
     "has established a new secret "
     "base on the remote ice world "
     "of Hoth.\n\n"
     "The evil lord Darth Vader, "
     "obsessed with finding young "
     "Skywalker, has dispatched "
     "thousands of remote probes into "
     "the far reaches of space.... "];

    [self.crawlView updateTextViaCrawl:crawl];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
