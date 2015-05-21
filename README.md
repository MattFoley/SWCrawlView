# SWCrawlView
<img src="http://i.imgur.com/eJHIeXF.png" width="400"><img src="http://i.imgur.com/XgYsfbh.png" width="400">

This control provides a realistic and interactive version of the original Theatrical Crawl for use in any app. The control is fully customizable, fonts, colors, text, etc can all be modified. It supports all iOS Devices (not the watch yet, sorry.), and both orientations. Very specific implementations may require source code tweaking.

#### Background
A long time ago, in a city far, far away (Chicago, I miss you), I built an app that let you create and export HD crawl videos and could mux it with your own music files. The app has fallen into heavy neglect, and hasn't been updated since 2013. It barely works right now, but if you're curious, you can check it out [here.](https://itunes.apple.com/us/app/star-wars-crawl-creator/id494406923?mt=8) 

As you can tell from the more recent reviews, having been built for iOS 4, Crawl Creator needs a serious over haul. So, I'm rebuilding her from the ground up, and as part of that, I'm open sourcing the SWCrawlView that I've rebuilt. I may follow up by open sourcing the .MP4 creation and YouTube uploading when that's ready.

### How To Use It:

It can be created either via a xib or initWithFrame. You can then edit it either one property at a time, or by creating a SWCrawl object and passing that in. Comments exist in the various headers to explain functionality, but the main class of interest will be "SWCrawlView" and "SWCrawl", the few others are just supporting files.

If you want to use the default fonts that match the movie, you'll need to add the "Fonts provided by application" key to your info.plist file. The view will begin customized to match the movies, but all properties can be changed and a redraw will be forced when any property is changed. 

See the Info.plist of the SWCrawlViewExample project to see the "Fonts provided by application".

A more detailed example project and documentation will follow soon.
