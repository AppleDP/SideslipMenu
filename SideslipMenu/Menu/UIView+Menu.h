//
//  UIView+Menu.h
//  SideslipMenu
//
//  Created by admin on 16/8/16.
//  Copyright © 2016年 SUWQ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    Left,
    Right,
    Top,
    Buttom
}Location;

@interface UIView (Menu)
- (void)addMenu:(UIView *)view
       location:(Location)location
   allowGesture:(BOOL)allowGesture;

- (void)showWithDuration:(NSTimeInterval)duration;
- (void)hideMenuDuration:(NSTimeInterval)duration;
@end










