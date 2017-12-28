# Pre-work - *Tipper*

**Tipper** is a tip calculator application for iOS.

Submitted by: **Alberto Nencioni**

Time spent: **20** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] Settings page to change the default tip percentage.
* [x] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Custom segmented control to have a better, personalized design. Implemented following [this tutorial](https://www.youtube.com/watch?v=xGdRCUrSu94).
- [x] Slider to see amount when splitting bill with 2 to 10 people.
- [x] Settings page to change the default group size.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/albinencio/Tipper/blob/master/TipperDemo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

This was my very first exposure to iOS development, therefore I took most of the time to try to understand the basics, aside from following the guidelines provided. The most challenging part was definitely trying to implement a customized segmented control, especially since I had to adjust what I had programmed following the tutorial to what was required by the app's implementation.
The main change I had to make, which was the origin to the other adjustments I had to deal with, was to instantiate the selectedSegmentIndex variable so that it would have called updateView() every time it was set. This was the optimal solution which allowed for a correct behavior when switching from the Settings to the Tip Calculator view: the segmented control inside Tip Calculator reflected the changes made in Settings.
Overall, the more I worked on the project, the more comfortable I felt with what I was doing, the more easily I completed and added the new features.

## License

    Copyright © 2017 Alberto Nencioni. All rights reserved. 

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
