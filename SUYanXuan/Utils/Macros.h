//
//  Utils.h
//  DreamOneByOne
//
//  Created by netease on 16/11/11.
//  Copyright © 2016年 Sevenuncle. All rights reserved.
//

#ifndef Utils_h
#define Utils_h
#define SCREEN_FRAME    ([[UIScreen mainScreen] bounds])                        //屏幕Frame
#define SCREEN_SIZE     (SCREEN_FRAME.size)                                     //屏幕大小
#define SCREEN_HEIGHT   (SCREEN_SIZE.height)                                    //屏幕高度
#define SCREEN_WIDTH    (SCREEN_SIZE.width)                                     //屏幕宽度
#define APP_FRAME       ([[UIScreen mainScreen] applicationFrame])              //AppFrame
#define APP_SIZE        (APP_FRAME.size)
#define APP_WIDTH       (APP_SIZE.width)
#define APP_HEIGHT      (APP_SIZE.height)
#define we(src,dst)     __weak __typeof(src) dst = src
#define COLOR           ([UIColor colorWithRed:arc4random_uniform(255)/255.f green:arc4random_uniform(255)/255.f  blue:arc4random_uniform(255)/255.f  alpha:0.9])

//#define IMG_COUNT       3
//#define IMG_W           SCREEN_WIDTH    /   IMG_COUNT - 10
//#define IMG_H           IMG_W



#endif /* Utils_h */
