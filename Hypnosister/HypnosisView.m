//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Steve Chakif on 2/6/14.
//  Copyright (c) 2014 Steve Chakif. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize circleColor;

- (id) initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    return self;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(motion == UIEventSubtypeMotionShake) {
        NSLog(@"Device started shaking!");
        [self setCircleColor:[UIColor redColor]];
    }
}

- (void)setCircleColor:(UIColor *)clr
{
    circleColor = clr;
    [self setNeedsDisplay];
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) drawRect:(CGRect)dirtyRect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    // Center
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    // Radius
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // The thickness of line
    CGContextSetLineWidth(ctx, 10);
    
    [[self circleColor] setStroke];
    
    //CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, YES);
    //CGContextStrokePath(ctx);

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(ctx);
    }
    
    NSString *text = @"You are getting sleepy.";
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    [[UIColor blackColor] setFill];
    
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    [text drawInRect:textRect withFont:font];
}



@end
