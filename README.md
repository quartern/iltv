## ILTV - data for IsraTV Roku app

English right below the Hebrew


הקבצים בריפו הזה משמשים את אפליקציית ישרא-טיוי (IsraTV) ברוקו

האפליקציה IsraTV היא אפליקציה תפריט פשוטה שמביאה מאסף סטרימס
של תחנות טלוויזיה ורדיו ישראליות למסך שלכם באשר תהיו.


### מה כלול ומה לא?
- קובץ המניפסט (`data/data.json`) כולל ערוצים רק מישראל או
  ערוצים שמקורם בגולה עם דגש יהודי. שימו לב שאני מתכוון להוסיף אופצייה להוסיף רשימת תכנים פרטית.
- תמיכה עברית באפליקציה - כדי לשמור על האפליקציה פשוטה החלטתי בשלב הראשון להשאר עם פורמט
  המסכים המוגדרים מראש של רוקו.  כתוצאה מכך אני מנוע משימוש בטקסט בעברית.
- VOD - באתרי האינטרנט של הרבה מהתחנות שבהם מאשרים צפייה בתכנים מוקלטים.  בשלב זה, בעיקר בגלל חוסר התמיכה בעברית אין לי אפשרות כרגע להוסיף תכנים כאלה.


----------------------------------------------------

This repo contains the channel manifest and other metadata for
my ([@quartern_roku](https://twitter.com/quartern_roku)) new
private Roku app IsraTV.

The IsraTV app is a simple menu driven app that just seeks to
curate most live streams for Israeli TV & Radio stations.

### Whats included and what is not?
- This manifest (data/data.json) includes only channels from Israel or 
  channels originating in the diaspora with Jewish focus.  Note that I do 
  intend on adding an augmentation feature to allow you to introduce a 
  supplementary manifest to be merged unto of this manifest at runtime, 
  augmenting only your experience.  
- Hebrew in the app - to keep the app simple I am staying with predefined
  Roku screen formats which means no Hebrew characters.  I have yet to 
  experiment with utilizing external fonts with custom screen layouts.
  I expect this to be not simple (to me anyway).   Not to say that this
  will never happen, but I refuse to even look at it for the next 6 months.
- VOD - many of providers provide many of their titles on an on-demand basis.
  I'm not going to explore this till at least the prior bullet (Hebrew) has
  been resolved as the content metadata will surely contain Hebrew.
- Won't include streams that I cant personally accesses & test.  This includes:
  + Streams that are geo-blocked (Russian language channel in Israel, #9 
    seems to be geo blocked)
  + Streams that are not natively supported by Roku.  The details are 
    technical and I'm definitely [not versed in the details myself] 
    (http://sdkdocs.roku.com/display/sdkdoc/Video+Encoding+Guidelines#VideoEncodingGuidelines-LiveVideo).  
    Usually if you can access the content on an Apple or Android mobile 
    device it would probably be compatible.  This does _NOT_ mean that you 
    should send me apps, links to apps, etc.  I'm not going to reverse 
    engineer those.  


### Why
Prior to putting this app together I had release other single-stream apps 
for few Israeli streams.  From time to time streams would change location 
and the apps would require an update.  Even if I had responded immediately 
to such a change it could take a day or two from the time of my pushing an 
update till a user would actually get it.  By separating the stream source 
from app I can be more responsive, and eventually let others chase after 
the updated stream URLs.  Reducing multiple apps to just one will should 
make it easier to make app updates.  


### Known Issues
- The i24 streams loop periodically (once or twice an hour?), just come 
  back in.  
- For some channels I have entered multiple streams.  They are tried in 
  order.  The standby stream for channel2-news has the video reduced with 
  a black frame.  If you observe that you can exit playback and retry.  


### Support / Contact
- I cannot help with content of streams, for example:
   + I cant help it if channel2-news leaves the daily headlines loop on
     instead of the latest full nightly news broadcast.
   + I can't help if you don't like a show
   + I can't help with quality of a stream, unless you get me an alternate 
     stream URL.  
- I go on twitter almost daily and that is the best way to reach me:
   + Follow me ([@quartern_roku](https://twitter.com/quartern_roku))
- Tag me in a message reporting the issue and I will follow you back
  we can DM (Direct message).  I will not have a drawn-out discussion
  about channel support out in the open (so be sure to follow me at 
  least until we have worked out the issues)


### Appreciation
I only invested time in this.  At the moment it does not cost me anything 
to make this available.  As you are getting something out of this please 
feel free pay it forward and make donations to worthy causes.  My 
recommendation it to donate to [Aleh Negev, Nahalat 
Eran](https://aleh.org/aleh-branches/aleh-negev-nahalat-eran) 
[(Donate)](https://aleh.org/donate-online/).  You may also decide to give 
something to the dude at [AnarchiTV (Kodi)](http://anarchitv.co), as I may 
consult / compare his list with mine.  


### Alternatives
There is obvious demand for a Roku-only solution as I have had over 4000 
installs for one of the predecessor apps.  If you need more than what 
IsraTV offers you you may want to look into [Kodi](http://kodi.tv) and 
[Plex](https://plex.tv).  See [comparison/discussion] 
(http://www.htpcbeginner.com/plex-vs-kodi-comparison-guide).  With Kodi 
having a large [support base for Israeli content](http://kodisrael.net/).


