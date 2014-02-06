//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Steve Chakif on 2/6/14.
//  Copyright (c) 2014 Steve Chakif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate> {
    HypnosisView *view;
}

@property (strong, nonatomic) UIWindow *window;

@end
