//
//  ViewController.m
//  CireView
//
//  Created by surekamMobile on 15/7/29.
//  Copyright (c) 2015年 Surekam. All rights reserved.
//

#import "ViewController.h"
#import "KTOneFingerRotationGestureRecognizer.h"

#define degreesToRadia(x) (M_PI * (x) / 180)    //角度->弧度


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"剪影数据";
    self.rightBtn1.accessibilityValue=@"right";
    self.leftBtn1.accessibilityValue=@"left";
    
    [self.rightBtn1 addTarget:self action:@selector(selectVision:) forControlEvents:UIControlEventTouchUpInside];
    [self.leftBtn1 addTarget:self action:@selector(selectVision:) forControlEvents:UIControlEventTouchUpInside];
    
  
    self.rightTextField3.delegate=self;
    self.leftTextField3.delegate=self;
    
    NSMutableArray *numArray = [NSMutableArray new];
    for (float i = 20.0f; i >= -20.0f; i -= 0.25f) {
        
        if(i>0){
            NSString *number = [NSString stringWithFormat:@"+%.2f",i];
            [numArray addObject:number];
        }
        else{
            NSString *number = [NSString stringWithFormat:@"%.2f",i];
            [numArray addObject:number];
            if (i==0.00) {
                NSLog(@"%lu",(unsigned long)numArray.count);
            }
        }
        
    }
    KTOneFingerRotationGestureRecognizer *rotation = [[KTOneFingerRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotating:)];
    
    KTOneFingerRotationGestureRecognizer *rotation1 = [[KTOneFingerRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotating:)];
    [self.circleLeftView addGestureRecognizer:rotation1];
    
    [self.circleRightView addGestureRecognizer:rotation];
    
    CALayer *showViewLayer = [self.showView layer];
    showViewLayer.borderWidth=0.5;
    showViewLayer.borderColor=[UIColor grayColor].CGColor;
    
    CALayer *l = [self.circleLeftView layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:5.0];
    self.circleLeftView.layer.cornerRadius=self.circleLeftView.frame.size.width/2;
    
    CALayer *l2 = [self.circleRightView layer];
    [l2 setMasksToBounds:YES];
    [l2 setCornerRadius:5.0];
    self.circleRightView.layer.cornerRadius=self.circleRightView.frame.size.width/2;
    
    if (_p_array&&_p_array.count>0) {
//        [self setUI];
    }

    // Do any additional setup after loading the view, typically from a nib.
}



- (void)rotating:(KTOneFingerRotationGestureRecognizer *)recognizer
{
    UIView *view = [recognizer view];
    
    CGAffineTransform transform = view.transform;
    CGFloat rotate = acosf(transform.a);
    if (transform.b < 0) {
        rotate+= M_PI;
    }

    CGFloat degree = rotate/M_PI * 180;
    
    if (view ==self.circleRightView) {
        self.rightTextField3.text=[NSString stringWithFormat:@"%d",[[NSNumber numberWithFloat:degree] intValue]];
        rightDegree = [recognizer rotation];
        NSLog(@"幅度rightDegree= %f",  rightDegree);
        
    }
    else{
        self.leftTextField3.text=[NSString stringWithFormat:@"%d",[[NSNumber numberWithFloat:degree] intValue]];
        leftDegree =[recognizer rotation];
        NSLog(@"幅度leftDegree= %f",  leftDegree);
        
    }
    float aa= [recognizer rotation]/M_PI * 180;
    
    NSLog(@"多少度---------------%f",aa);
    
    
    [view setTransform:CGAffineTransformRotate([view transform], [recognizer rotation])];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
