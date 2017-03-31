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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnPressed:(UIButton *)sender {
    NSLog(@"loginBtnPressed");
}

- (IBAction)registerBtnPressed:(UIButton *)sender {
    NSLog(@"registerBtnPressed");
}

@end
