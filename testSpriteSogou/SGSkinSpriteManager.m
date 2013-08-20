//
//  SGSkinSpriteManager.m
//  SogouInput_iPhone
//
//  Created by Vicent on 13-8-14.
//
//
#import "ccMacros.h"
#import "SGSkinSpriteManager.h"

SGSkinSpriteManager *g_skinSpriteManager = nil;

@implementation SGSkinSpriteManager

#pragma mark - init dealloc

- (id)init
{
    if (self = [super init])
    {
        CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];

        [frameCache addSpriteFramesWithFile:@"game-art.plist"];        
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

+ (SGSkinSpriteManager*)sharedSkinSpriteManager
{
    @synchronized(self)
	{
        if (!g_skinSpriteManager)
            g_skinSpriteManager = [[SGSkinSpriteManager alloc] init];
    }
    
    return g_skinSpriteManager;
}

- (UIImage*)imageWithName:(NSString*)imageName
{
    UIImage *returnImage = nil;
    CCSprite* sprite = [CCSprite spriteWithSpriteFrameName:imageName];
    if (sprite)
    {
        returnImage = [self convertSpriteToImage:sprite];
        NSLog(@"sprite %@", NSStringFromCGSize(sprite.contentSize));
    }
    
    return returnImage;
}

- (UIImage*) convertSpriteToImage:(CCSprite *)sprite
{
    CGPoint p = sprite.anchorPoint;
    [sprite setAnchorPoint:ccp(0,0)];
    CCRenderTexture *renderer = [CCRenderTexture renderTextureWithWidth:sprite.contentSize.width height:sprite.contentSize.height];
    [renderer begin];
    [sprite visit];
    [renderer end];
    [sprite setAnchorPoint:p];
    return [UIImage imageWithData:[renderer getUIImageAsDataFromBuffer:kCCImageFormatPNG]];
}

@end
