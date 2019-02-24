//
//  SCDrawView.m
//  Drawboard
//
//  Created by Stephen Cao on 24/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCDrawView.h"
@interface SCDrawView()
@property(nonatomic,weak)SCBezierPath *path;
@end
@implementation SCDrawView
- (NSMutableArray *)pathGroup{
    if(_pathGroup == nil){
        _pathGroup = [[NSMutableArray alloc]init];
    }
    return _pathGroup;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    for(SCBezierPath *path in self.pathGroup){
        [path setLineCapStyle:kCGLineCapRound];
        [path.pathColor set];
        [path setLineJoinStyle:kCGLineJoinRound];
        [path stroke];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    SCBezierPath *path = [[SCBezierPath alloc] init];
    path.pathColor = self.pathColor;
    self.path = path;
    [self.path setLineWidth:self.pathWidth];
    [self.path moveToPoint:point];
    [self.pathGroup addObject:self.path];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    [self.path addLineToPoint:point];
    [self setNeedsDisplay];
}

@end
