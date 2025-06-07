#Memory Card Game

Submitted by: Brandon Christian

Memory Game is a Card based memory game where the user must flip Two cards with identical emojis on the other side to remove them from the grid. 
Once the user has cleared out the entire grid of cards they have the option to restart the game and or adjust the grid size for even more cards. 

The purpose of this project is to gain familiarity with Swift UI and build out my first project without any start files or source materials. 

Time spent: **13** hours spent in total

# Required Features

The following required functionality is completed:

- [X] App loads to display a grid of cards initially placed face-down:
  - Upon launching the app, a grid of cards should be visible.
  - Cards are facedown to indicate the start of the game.

- [X] Users can tap cards to toggle their display between the back and the face: 
  - Tapping on a facedown card should flip it to reveal the front.
  - Tapping a second card that is not identical should flip both back down

- [X] When two matching cards are found, they both disappear from view:
  - Implement logic to check if two tapped cards match.
  - If they match, both cards should disappear.
  - If they don't match, they should return to the facedown position.

- [X] User can reset the game and start a new game via a button:
  - Include a button that allows users to reset the game.
  - This button should shuffle the cards and reset any game-related state.
 

The following **optional** features are implemented:

- [X] User can select number of pairs to play with (at least 2 unique values like 2 and 4).
  * (Hint: user Picker)

- [X] App allows for user to scroll to see pairs out of view.
  * (Hint: Use a Scroll view)

- [X] Add any flavor you’d like to your UI with colored buttons or backgrounds, unique cards, etc. 
  * Enhance the visual appeal of the app with colored buttons, backgrounds, or unique card designs.
  * Consider using animations or transitions to make the user experience more engaging.

The following **additional** features are implemented:

- [] List anything else that you can get done to improve the app functionality!

## GIF Walkthrough


![ScreenRecording2024-10-15at7 14 57PM-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/ea4617e5-de62-4888-9c2c-01565e27eed7)


## Notes
Trying to figure out how to formulate the game logic took me a while to get right. An admittedly I was going a little crazy try to get the cards statues 
to update when trying to get them to compare and then dismiss after getting a match. I did find a use a simple guide for setting up the launch screen 
correctly but once I did I got enough confidence to experiment a little. Ended up doing the same intro I did for lab 4 do to time constraints but come 
project 5 I’ll use a different animation to continue improving on visuals and presentation. 

## License
    Copyright [2024] [Brandon Christian]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.





