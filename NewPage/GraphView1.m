
#import "GraphView1.h"

@implementation GraphView1
- (void)drawRect:(CGRect)frame {
        UIBezierPath *ovalpath =  [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, frame.size.height-2) radius:frame.size.height startAngle:90 endAngle:0 clockwise:false];
      [[UIColor colorWithRed:(0.0/255.0) green:(105.0/255) blue:(165.0/255) alpha:1] setFill];
     [ovalpath fill];
}

@end
