//
//  LoginViewController.m
//  Practice
//
//  Created by zhaofei on 2017/4/1.
//  Copyright © 2017年 ZhaoFei. All rights reserved.
//

#import "LoginViewController.h"
#import "Defines.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *telBtn;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *lineViews;
@property (weak, nonatomic) IBOutlet UILabel *accountLabel;
@property (weak, nonatomic) IBOutlet UILabel *pwdLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetPwdBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UILabel *registerLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // draw navigationBar
    //self.navigationController.navigationBar.backgroundColor = UIColorFromHex(0x00be00);
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    navigationBar.translucent = NO; // 半透明 不
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName: UIColorFromHex(0xff2121),
                                 NSFontAttributeName: [UIFont boldSystemFontOfSize:16]
                                 };
    navigationBar.titleTextAttributes = attributes;

    // draw navigationItem
    UIImage *image = self.navigationItem.leftBarButtonItem.image;
    self.navigationItem.leftBarButtonItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    // draw lineViews
    for (UIView *view in self.lineViews) {
        view.backgroundColor = UIColorFromHex(0xe8e8e8);
    }
    
    // draw view
    self.view.backgroundColor = UIColorFromHex(0xf4f5f7);

    // draw telBtn
    [self.telBtn setTitleColor:UIColorFromHex(0x00be00) forState:UIControlStateNormal];
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc]initWithString:self.telBtn.titleLabel.text attributes:attribtDic];
    self.telBtn.titleLabel.attributedText = attributedText;
    
    // draw accountLabel & pwdLabel
    self.accountLabel.textColor = UIColorFromHex(0x1a1b1d);
    self.pwdLabel.textColor = UIColorFromHex(0x1a1b1d);

    // draw loginBtn
    [self.loginBtn setTitleColor:UIColorFromHex(0xffffff) forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = UIColorFromHex(0x7c7d7f);
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = 2.0;
    
    // draw forgetPwdBtn & registerBtn &registerLabel
    [self.forgetPwdBtn setTitleColor:UIColorFromHex(0x939393) forState:UIControlStateNormal];
    [self.registerBtn setTitleColor:UIColorFromHex(0x00be00) forState:UIControlStateNormal];
    self.registerLabel.textColor = UIColorFromHex(0x939393);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)telBtnPressed:(UIButton *)sender {
    NSLog(@"telBtnPressed");
}

- (IBAction)backBtnPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loginBtnPressed:(UIButton *)sender {
    sender.backgroundColor = UIColorFromHex(0x7c7d7f);
}

- (IBAction)loginBtnPressedHighlighted:(UIButton *)sender {
    sender.backgroundColor = UIColorFromHex(0x7b7c7e);
}

- (IBAction)forgetPwdBtnPressed:(UIButton *)sender {
    NSLog(@"forgetPwdBtnPressed");
}

- (IBAction)registerBtnPressed:(UIButton *)sender {
    NSLog(@"registerBtnPressed");
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
