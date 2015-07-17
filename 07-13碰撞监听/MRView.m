//
//  MRView.m
//  07-13碰撞监听
//
//  Created by Asuna on 15/7/13.
//  Copyright (c) 2015年 MR. All rights reserved.
//

#import "MRView.h"
//屏幕的高度和宽度
#define SCREENHEIGHT   [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH    [UIScreen mainScreen].bounds.size.width

//图片的高度和宽度
#define IMAGEWIDTH     50
#define IMAGEHEIGHT    50

@interface MRView()

@property (nonatomic,strong) UIImage *imageBackgound;
@property (nonatomic,strong) UIImage *imageBird;

@property (nonatomic,assign) CGFloat birdX;
@property (nonatomic,assign) CGFloat birdY;

@property (nonatomic,assign) CGFloat birdSpeedX;
@property (nonatomic,assign) CGFloat birdSpeedY;

@property (nonatomic,assign) CGFloat gBirdSpeed;
@end

@implementation MRView
- (void)awakeFromNib
{
    
    self.backgroundColor = [UIColor blackColor];
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    self.imageBackgound = [UIImage imageNamed:@"IMG_0465.jpg"];
    self.imageBird = [UIImage imageNamed:@"QQ20150714-1"];
    
    self.birdX = 10;
    self.birdY = 10;
    
    self.birdSpeedX = 2.5;
    self.birdSpeedY = 0;
    
    self.gBirdSpeed = 3;
}

- (void)drawRect:(CGRect)rect
{
    [self.imageBird drawInRect:CGRectMake(_birdX, _birdY, IMAGEWIDTH,IMAGEHEIGHT)];
    
    _gBirdSpeed += _gBirdSpeed;
    _birdX += _birdSpeedX;
    _birdY += _birdSpeedY;
    
    if (_birdY >= SCREENHEIGHT - IMAGEWIDTH) {
        _birdY = SCREENHEIGHT - IMAGEWIDTH;
        self.birdSpeedY = -self.birdSpeedY;
    }

    if (_birdX >= SCREENWIDTH - IMAGEHEIGHT) {
        _birdX = SCREENWIDTH - IMAGEHEIGHT;
    }
}

@end
