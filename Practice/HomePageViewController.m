//
//  ViewController.m
//  Practice
//
//  Created by zhaofei on 2017/3/30.
//  Copyright © 2017年 ZhaoFei. All rights reserved.
//

#import "HomePageViewController.h"
#import "Defines.h"

@interface HomePageViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // draw loginBtn
    [self.loginBtn setTitleColor:UIColorFromHex(0x00be00) forState:UIControlStateNormal];
    CALayer *layer = self.loginBtn.layer;
    layer.masksToBounds = YES;
    layer.cornerRadius = 2.0;
    layer.borderWidth = 1.0;
    layer.borderColor = UIColorFromHex(0x00be00).CGColor;
    
    // draw registerBtn
    [self.registerBtn setTitleColor:UIColorFromHex(0xffffff) forState:UIControlStateNormal];
    self.registerBtn.backgroundColor = UIColorFromHex(0x00be00);
    self.registerBtn.layer.masksToBounds = YES;
    self.registerBtn.layer.cornerRadius = 2.0;
    
    // draw btn0, btn1, btn2
    [self.btn0 setBackgroundImage:[self imageWithColor:UIColorFromHex(0xaaaaaa)] forState:UIControlStateNormal];
    [self.btn0 setBackgroundImage:[self imageWithColor:UIColorFromHex(0xe5e5e5)] forState:UIControlStateSelected];
    self.btn0.layer.masksToBounds = YES;
    self.btn0.layer.cornerRadius = 4.0;
    self.btn0.selected = YES;

    [self.btn1 setBackgroundImage:[self imageWithColor:UIColorFromHex(0xaaaaaa)] forState:UIControlStateNormal];
    [self.btn1 setBackgroundImage:[self imageWithColor:UIColorFromHex(0xe5e5e5)] forState:UIControlStateSelected];
    self.btn1.layer.masksToBounds = YES;
    self.btn1.layer.cornerRadius = 4.0;
    
    [self.btn2 setBackgroundImage:[self imageWithColor:UIColorFromHex(0xaaaaaa)] forState:UIControlStateNormal];
    [self.btn2 setBackgroundImage:[self imageWithColor:UIColorFromHex(0xe5e5e5)] forState:UIControlStateSelected];
    self.btn2.layer.masksToBounds = YES;
    self.btn2.layer.cornerRadius = 4.0;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (IBAction)loginBtnPressed:(UIButton *)sender {
    sender.layer.borderColor = UIColorFromHex(0x00be00).CGColor;
}

- (IBAction)loginBtnPressedHighlighted:(UIButton *)sender {
    sender.layer.borderColor = UIColorFromHex(0x00ab00).CGColor;
}


- (IBAction)registerBtnPressed:(UIButton *)sender {
    sender.backgroundColor = UIColorFromHex(0x00be00);
}

- (IBAction)registerBtnPressedHighlighted:(UIButton *)sender {
    sender.backgroundColor = UIColorFromHex(0x00ab00);
}

- (IBAction)btn0Pressed:(UIButton *)sender {
    if (sender.tag == 10) {
        self.btn0.selected = YES;
        self.btn1.selected = NO;
        self.btn2.selected = NO;
    } else if (sender.tag == 11) {
        self.btn0.selected = NO;
        self.btn1.selected = YES;
        self.btn2.selected = NO;
    } else {
        self.btn0.selected = NO;
        self.btn1.selected = NO;
        self.btn2.selected = YES;
    }
}
@end
