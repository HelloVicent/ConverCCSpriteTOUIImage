//
//  SGSkinSpriteManager.h
//  SogouInput_iPhone
//
//  Created by Vicent on 13-8-14.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SGSkinSpriteManager : NSObject

+ (SGSkinSpriteManager*)sharedSkinSpriteManager;
- (UIImage*)imageWithName:(NSString*)imageName;
@end
