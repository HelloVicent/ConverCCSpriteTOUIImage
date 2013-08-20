//
//  ViewController.m
//  testSpriteSogou
//
//  Created by Vicent on 13-8-20.
//  Copyright (c) 2013年 Vicent. All rights reserved.
//

#import "ViewController.h"
#import "cocos2d.h"
#import "SGSkinSpriteManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	EAGLView *glView = [EAGLView viewWithFrame:[[[UIApplication sharedApplication]keyWindow] bounds]
                                   pixelFormat:kEAGLColorFormatRGBA8
                                   depthFormat:0 /* GL_DEPTH_COMPONENT24_OES */
                            preserveBackbuffer:NO
                                    sharegroup:nil
                                 multiSampling:NO
                               numberOfSamples:0
                        ];
    
//    UIImage *image = [UIImage imageNamed:@"fffff.png"];
    
    UIImage *testImage = [[SGSkinSpriteManager sharedSkinSpriteManager]imageWithName:@"ship-anim0.png"];
    NSLog(@"testImage %@", NSStringFromCGSize(testImage.size));
    
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.image = testImage;
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
