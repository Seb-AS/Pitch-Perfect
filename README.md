# Pitch Perfect
Project developed for Udacity iOS Developer Nanodegree

Development environment: 
IDE: Xcode 7.3+ 
Language: Swift

## Summary

The Pitch Perfect app allows users to record a sound using the device’s microphone. It then allows users to play the recorded sound back with four different sound modulations: Chipmunk, Darth Vader, Super Slow, and Super Fast.

![pitch](https://cloud.githubusercontent.com/assets/2106935/14800911/9ab11b3a-0b1b-11e6-8721-b3281cfba7f4.gif)

## Implementation

The app has two view controller scenes:

- **RecordSoundsViewController** - consists a record button with a microphone image. Tapping this microphone button 
starts an audio recording session and present a stop button. When the stop button is clicked, the app completes recording and then show the PlaySound controller.

- **PlaySoundsViewController** - contains six buttons to play the recorded sound file with different effects and a button to stop the playback.

The application uses code from `AVFoundation` to record sounds from the microphone (`AVAudioRecorder`) and play recorded audio with effects (`AVAudioPlayer`, `AVAudioEngine`).

## License

Copyright (c) 2016 Sebastian Masseroni

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
