//
//  ViewController.h
//  CireView
//
//  Created by surekamMobile on 15/7/29.
//  Copyright (c) 2015年 Surekam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{
    CGPoint  originalLocation;
    
    CGFloat leftDegree;
    CGFloat rightDegree;
    
    
    NSArray *numVisionArray;
    UIPopoverController *createPatientPopover;
    NSString *title;
    
}
@property(nonatomic,strong) NSArray *p_array;


@property(nonatomic,strong)IBOutlet UIImageView *circleImageView;
@property(nonatomic,strong)IBOutlet UIView *circleLeftView;
@property(nonatomic,strong)IBOutlet UIView *circleRightView;
@property(nonatomic,retain)IBOutlet UIView *showView;

@property(nonatomic,retain)IBOutlet UIButton *leftBtn1;
@property(nonatomic,retain)IBOutlet UITextField * leftTextField1;
@property(nonatomic,retain)IBOutlet UITextField * leftTextField2;
@property(nonatomic,retain)IBOutlet UITextField * leftTextField3;
@property(nonatomic,retain)IBOutlet UISegmentedControl *leftSegment;

@property(nonatomic,retain)IBOutlet UIButton *rightBtn1;
@property(nonatomic,retain)IBOutlet UITextField * rightTextField1;
@property(nonatomic,retain)IBOutlet UITextField * rightTextField2;
@property(nonatomic,retain)IBOutlet UITextField * rightTextField3;
@property(nonatomic,retain)IBOutlet UISegmentedControl *rightSegment;

@end

