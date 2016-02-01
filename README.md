# RTSPPlayerOSX
RTSP Player for OSX

This project is a demo for streaming RTSP Video stream in OSX

Has been tested with MJPEG and H.264 streams

This project is based on the RTSP Player for iOS from: https://github.com/durfu/DFURTSPPlayer

It was modified son it can work with Cocoa/OSX

Steps:


1- First of all download ffmpeg libraries from Brew in console:
```
brew install ffmpeg
```
The libraries would be in /usr/local/Cellar/ffmpeg/version/

Where version stands for the version you donwloaded, this project used the version: 2.8.5

2.-Copy the libraries to your Xcode project, go to /usr/local/Cellar/ffmpeg/2.8.5/lib

and copy these files to your Xcode project:
```
libavcodec.dylib
libavdevice.dylib
libavfilter.dylib
libavformat.dylib
libavresample.dylib
libavutil.dylib
libpostproc.dylib
libswresample.dylib
libswscale.dylib
```
3.-Configure Xcode, go to /Target/Build Settings and look for "Search paths", configure like this:
```
Always Search User Paths    YES
Framework Search Paths      /usr/local/Cellar/ffmpeg/2.8.5/lib
Header Search Paths         /usr/local/Cellar/ffmpeg/2.8.5/include
Library Search Paths        /usr/local/Cellar/ffmpeg/2.8.5/lib
```
4.-Finally copy the files from the folder "FFMpegDecoder" inside this repo.

You are ready!

You can download this project as an example, in order to work it only needs the ffmpeg library installed in the system.

