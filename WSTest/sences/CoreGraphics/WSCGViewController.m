//
//  WSCGViewController.m
//  WSTest
//
//  Created by wangshen on 2017/5/9.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSCGViewController.h"


@interface WSCGView : UIView

/**
 类型  0 绘制文字   1 绘制线
 */
@property (nonatomic ,assign) NSInteger type;

@end

@implementation WSCGView


- (void)drawRect:(CGRect)rect {

//    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    switch (self.type) {
        case 0:
            [self _drawTextInRect:rect context:context];
            break;
        case 1:
            [self _drawLineInRect:rect context:context];
            break;
            
        default:
            break;
    }

    
}

- (void)_drawTextInRect:(CGRect )rect context:(CGContextRef )context {
    char *string = "this is a text";
    
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    
    // Some initial setup for our text drawing needs.
    // First, we will be doing our drawing in Helvetica-36pt with the MacRoman encoding.
    // This is an 8-bit encoding that can reference standard ASCII characters
    // and many common characters used in the Americas and Western Europe.
    CGContextSelectFont(context, "Helvetica", 18, kCGEncodingMacRoman);
    // Next we set the text matrix to flip our text upside down. We do this because the context itself
    // is flipped upside down relative to the expected orientation for drawing text (much like the case for drawing Images & PDF).
    //翻转 如果不调用这个个函数  绘制的文字将会是镜像的
    CGContextSetTextMatrix(context, CGAffineTransformMakeScale(1.0, -1.0));
    // And now we actually draw some text. This screen will demonstrate the typical drawing modes used.
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextShowTextAtPoint(context, 10.0, 30.0, string, strlen(string));
    CGContextSetTextDrawingMode(context, kCGTextStroke);
    CGContextShowTextAtPoint(context, 10.0, 70.0, string, strlen(string));
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    CGContextShowTextAtPoint(context, 10.0, 110.0, string, strlen(string));
    
    // Now lets try the more complex Glyph functions. These functions allow you to draw any glyph available in a font,
    // but provide no assistance with converting characters to glyphs or layout, and as such require considerably more knowledge
    // of text to use correctly. Specifically, you need to understand Unicode encoding and how to interpret the information
    // present in the font itself, such as the cmap table.
    // To get you started, we are going to do the minimum necessary to draw a glyphs into the current context.
    CGFontRef helvetica = CGFontCreateWithFontName((CFStringRef)@"Helvetica");
    CGContextSetFont(context, helvetica);
    CGContextSetFontSize(context, 12.0);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    // Next we'll display lots of glyphs from the font.
    CGGlyph start = 0;
    for(int y = 0; y < 20; ++y)
    {
        CGGlyph glyphs[32];
        for(int i = 0; i < 32; ++i)
        {
            glyphs[i] = start + i;
        }
        start += 32;
        CGContextShowGlyphsAtPoint(context, 10.0, 150.0 + 12 * y, glyphs, 32);
    }
    CGFontRelease(helvetica);
}

- (void)_drawLineInRect:(CGRect )rect context:(CGContextRef )context {
    // Drawing with a white stroke color
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    // And draw with a blue fill color
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 4.0);
    
    // Add an ellipse circumscribed in the given rect to the current path, then stroke it
    CGContextAddEllipseInRect(context, CGRectMake(30.0, 30.0, 60.0, 60.0)); //内切圆
    CGContextStrokePath(context);
    
     // Stroke 2 seperate arcs
    CGContextAddArc(context, 150.0, 60.0, 30.0, 0.0, M_PI/2.0, false);
    CGContextStrokePath(context);  //存储画笔
    CGContextAddArc(context, 150.0, 60.0, 30.0, 3.0*M_PI/2.0, M_PI, true);
    CGContextStrokePath(context);
    
    // Stroke 2 arcs together going opposite directions.
    CGContextAddArc(context, 150.0, 150.0, 30.0, 0.0, M_PI/2.0, false);
    CGContextAddArc(context, 150.0, 150.0, 30.0, 3.0*M_PI/2.0, M_PI, true);
    CGContextStrokePath(context);
    
    // Stroke 2 arcs together going the same direction..
    CGContextAddArc(context, 150.0, 240.0, 30.0, 0.0, M_PI/2.0, false);
    CGContextAddArc(context, 150.0, 240.0, 30.0, M_PI, 3.0*M_PI/2.0, false);
    CGContextStrokePath(context);
    
    // Stroke an arc using AddArcToPoint
    CGPoint p[3] =
    {
        CGPointMake(210.0, 30.0),
        CGPointMake(210.0, 60.0),
        CGPointMake(240.0, 60.0),
    };
    CGContextMoveToPoint(context, p[0].x, p[0].y);
    CGContextAddArcToPoint(context, p[1].x, p[1].y, p[2].x, p[2].y, 30.0);
    CGContextStrokePath(context);
    
    // Show the two segments that are used to determine the tangent lines to draw the arc.
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextAddLines(context, p, sizeof(p)/sizeof(p[0]));
    CGContextStrokePath(context);
    
    // As a bonus, we'll combine arcs to create a round rectangle!
    
    // Drawing with a white stroke color
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    
    // If you were making this as a routine, you would probably accept a rectangle
    // that defines its bounds, and a radius reflecting the "rounded-ness" of the rectangle.
    CGRect rrect = CGRectMake(210.0, 90.0, 60.0, 60.0);
    CGFloat radius = 10.0;
    // NOTE: At this point you may want to verify that your radius is no more than half
    // the width and height of your rectangle, as this technique degenerates for those cases.
    
    // In order to draw a rounded rectangle, we will take advantage of the fact that
    // CGContextAddArcToPoint will draw straight lines past the start and end of the arc
    // in order to create the path from the current position and the destination position.
    
    // In order to create the 4 arcs correctly, we need to know the min, mid and max positions
    // on the x and y lengths of the given rectangle.
    CGFloat minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect), midy = CGRectGetMidY(rrect), maxy = CGRectGetMaxY(rrect);
    
    // Next, we will go around the rectangle in the order given by the figure below.
    //       minx    midx    maxx
    // miny    2       3       4
    // midy   1 9              5
    // maxy    8       7       6
    // Which gives us a coincident start and end point, which is incidental to this technique, but still doesn't
    // form a closed path, so we still need to close the path to connect the ends correctly.
    // Thus we start by moving to point 1, then adding arcs through each pair of points that follows.
    // You could use a similar tecgnique to create any shape with rounded corners.
    
    // Start at 1
    CGContextMoveToPoint(context, minx, midy);
    // Add an arc through 2 to 3
    CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
    // Add an arc through 4 to 5
    CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
    // Add an arc through 6 to 7
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    // Add an arc through 8 to 9
    CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
    // Close the path
    CGContextClosePath(context);
    // Fill & stroke the path
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end

@interface WSCGViewController ()

@property (nonatomic, strong) WSCGView *cgview;

@end

@implementation WSCGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Core Graphics";
    
    self.cgview = [[WSCGView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 100, 300, 300)];
    self.cgview.backgroundColor = [UIColor lightGrayColor];
    self.cgview.type = 1;
    [self.view addSubview:self.cgview];
    
    
    NSArray *array = @[@"绘制文字",@"绘制线"];
    for (NSInteger i = 0; i < array.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 1000 + i;
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [btn setTitle:array[i] forState:UIControlStateNormal];
//        btn.backgroundColor = [UIColor orangeColor];
        btn.frame = CGRectMake(10 + (80 + 10) * i, 500, 80, 40);
        [self.view addSubview:btn];
    }
}

- (void)btnAction:(UIButton *)sender {

    NSInteger tag = sender.tag - 1000;
    self.cgview.type = tag;
    [self.cgview setNeedsDisplay];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
