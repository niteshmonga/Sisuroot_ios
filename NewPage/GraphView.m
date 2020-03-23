
#import "GraphView.h"

@implementation GraphView
- (void)drawRect:(CGRect)frame {
      UIBezierPath *ovalpath =  [UIBezierPath bezierPathWithArcCenter:CGPointMake(frame.size.height-2, frame.size.height-2) radius:frame.size.height startAngle:180 endAngle:90 clockwise:false];
     [[UIColor colorWithRed:(0.0/255.0) green:(105.0/255) blue:(165.0/255) alpha:1] setFill];
     [ovalpath fill];
}

@end
