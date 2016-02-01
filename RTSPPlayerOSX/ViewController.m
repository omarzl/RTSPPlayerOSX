//
//  ViewController.m
//  RTSPPlayerOSX
//
//  Created by Omar Zúñiga Lagunas on 01/02/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

#import "ViewController.h"
#import "RTSPPlayer.h"

#define LERP(A,B,C) ((A)*(1.0-C)+(B)*C)

@interface ViewController()

@property (nonatomic, retain) IBOutlet NSImageView *imageView;
@property (nonatomic, retain) RTSPPlayer *video;
@property (nonatomic, retain) NSTimer *nextFrameTimer;
@property (nonatomic) float lastFrameTime;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lastFrameTime = -1;
    self.video = [[RTSPPlayer alloc] initWithVideo:@"rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov" usesTcp:YES];
    self.video.outputWidth=1280;
    self.video.outputHeight = 720;
    [self.video seekTime:0.0];
    self.nextFrameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/30
                                                           target:self
                                                         selector:@selector(displayNextFrame:)
                                                         userInfo:nil
                                                          repeats:YES];
}

-(void)displayNextFrame:(NSTimer *)timer
{
    NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];
    if (![self.video stepFrame]) {
        [timer invalidate];
        [self.video closeAudio];
        return;
    }
    self.imageView.image = self.video.currentImage;
    float frameTime = 1.0/([NSDate timeIntervalSinceReferenceDate]-startTime);
    if (self.lastFrameTime<0) {
        self.lastFrameTime = frameTime;
    } else {
        self.lastFrameTime = LERP(frameTime, self.lastFrameTime, 0.8);
    }
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

@end
