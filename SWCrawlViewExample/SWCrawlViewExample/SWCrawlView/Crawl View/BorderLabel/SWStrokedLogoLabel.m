//
//  SWStrokedLogoLabel.m
//
//  Created by Tj on 5/16/15.
//  Copyright (c) 2015 Tj. All rights reserved.
//

#import "SWStrokedLogoLabel.h"

@implementation SWStrokedLogoLabel

- (void)drawTextInRect:(CGRect)rect {
    
    CGSize shadowOffset = self.shadowOffset;
    UIColor *textColor = self.textColor;
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(c, self.strokeWidth);
    CGContextSetLineJoin(c, kCGLineJoinMiter);
    
    CGContextSetTextDrawingMode(c, kCGTextStroke);
    self.textColor = self.strokeColor;
    [super drawTextInRect:rect];
    
    CGContextSetTextDrawingMode(c, kCGTextFill);
    self.textColor = textColor;
    self.shadowOffset = CGSizeMake(0, 0);
    [super drawTextInRect:rect];
    
    self.shadowOffset = shadowOffset;
}

@end
