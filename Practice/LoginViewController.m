//
//  LoginViewController.m
//  Practice
//
//  Created by zhaofei on 2017/4/1.
//  Copyright © 2017年 ZhaoFei. All rights reserved.
//

#import "LoginViewController.h"
#import "Defines.h"
#import "CreateShopViewController.h"

@interface LoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *telBtn;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *lineViews;
@property (weak, nonatomic) IBOutlet UILabel *accountLabel;
@property (weak, nonatomic) IBOutlet UILabel *pwdLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetPwdBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UILabel *registerLabel;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;
@property (weak, nonatomic) IBOutlet UIView *waitingView;
@property (weak, nonatomic) IBOutlet UILabel *wrongOfAccountAndPwdLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
    // draw navigationBar
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
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
    self.loginBtn.userInteractionEnabled = NO;
    
    // draw forgetPwdBtn & registerBtn &registerLabel
    [self.forgetPwdBtn setTitleColor:UIColorFromHex(0x939393) forState:UIControlStateNormal];
    [self.registerBtn setTitleColor:UIColorFromHex(0x00be00) forState:UIControlStateNormal];
    self.registerLabel.textColor = UIColorFromHex(0x939393);
    
    // draw accountTextField & pwdTextField & clearBtn
    NSMutableParagraphStyle *style = [self.accountTextField.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    
    style.minimumLineHeight = self.accountTextField.font.lineHeight - (self.accountTextField.font.lineHeight - [UIFont systemFontOfSize:14.0].lineHeight) / 2.0;
    NSDictionary *attributedPlaceholderDic = @{
                                               NSForegroundColorAttributeName: UIColorFromHex(0x939393),
                                               NSFontAttributeName: [UIFont systemFontOfSize:14],
                                               NSParagraphStyleAttributeName: style
                                               };
    NSMutableAttributedString *attributedPlaceholderOfAccount = [[NSMutableAttributedString alloc]initWithString:self.accountTextField.placeholder attributes:attributedPlaceholderDic];
    self.accountTextField.attributedPlaceholder = attributedPlaceholderOfAccount;
    self.accountTextField.tintColor = UIColorFromHex(0x00be00);
    self.accountTextField.textColor = UIColorFromHex(0x1a1b1d);
    
    NSMutableAttributedString *attributedPlaceholderOfPwd = [[NSMutableAttributedString alloc]initWithString:self.pwdTextField.placeholder attributes:attributedPlaceholderDic];
    self.pwdTextField.attributedPlaceholder = attributedPlaceholderOfPwd;
    self.pwdTextField.tintColor = UIColorFromHex(0x00be00);
    self.pwdTextField.textColor = UIColorFromHex(0x1a1b1d);
    
    self.clearBtn.hidden = YES;

    // draw waitingView
    self.waitingView.backgroundColor = UIColorFromHex(0x000000);
    self.waitingView.layer.masksToBounds = YES;
    self.waitingView.layer.cornerRadius = 4.0;
    self.waitingView.alpha = 0.9;
    
    // draw wrongOfAccountAndPwdLabel
    self.wrongOfAccountAndPwdLabel.textColor = UIColorFromHex(0xff2121);
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (IBAction)telBtnPressed:(UIButton *)sender {
    NSLog(@"telBtnPressed");
}

- (IBAction)backBtnPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loginBtnPressed:(UIButton *)sender {
    // read
    NSLog(@"account = %@ -- accountTextField", self.accountTextField.text);
    NSLog(@"pwd = %@ -- accountTextField", self.pwdTextField.text);
    self.waitingView.hidden = NO;
    self.view.userInteractionEnabled = NO;
    self.navigationController.navigationBar.userInteractionEnabled = NO;
    if ([self.accountTextField.text isEqual: @"1"]) {
        [self performSelector:@selector(loginSuccessed) withObject:self afterDelay:2.0];
    } else {
        [self performSelector:@selector(loginFailed) withObject:self afterDelay:2.0];
    }
    
//    if (self.accountTextField.text.length != 0 && self.pwdTextField.text.length != 0) {
//        sender.backgroundColor = UIColorFromHex(0x00be00);
//    } else {
//        sender.backgroundColor = UIColorFromHex(0x7c7d7f);
//    }
    //[NSThread sleepForTimeInterval:2.0];
    //self.waitingView.hidden = YES;
}

- (void)loginSuccessed {
    self.waitingView.hidden = YES;
    self.view.userInteractionEnabled = YES;
    self.navigationController.navigationBar.userInteractionEnabled = YES;
    UINavigationController *createShopNV = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateShopNC"];
    [self presentViewController:createShopNV animated:YES completion:nil];
}

- (void)loginFailed {
    self.waitingView.hidden = YES;
    self.view.userInteractionEnabled = YES;
    self.navigationController.navigationBar.userInteractionEnabled = YES;
    self.wrongOfAccountAndPwdLabel.hidden = NO;
    [self backroundTap:nil];
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

- (IBAction)clearBtnPressed:(UIButton *)sender {
    self.accountTextField.text = @"";
    sender.hidden = YES;
    self.loginBtn.backgroundColor = UIColorFromHex(0x7c7d7f);
    self.loginBtn.userInteractionEnabled = NO;
}

- (void)textChange:(NSNotification *)notification {
    if (self.accountTextField.text.length == 0) {
        self.clearBtn.hidden = YES;
    } else {
        self.clearBtn.hidden = NO;
    }
    if (self.accountTextField.text.length != 0 && self.pwdTextField.text.length != 0) {
        self.loginBtn.backgroundColor = UIColorFromHex(0x00be00);
        self.loginBtn.userInteractionEnabled = YES;
    } else {
        self.loginBtn.backgroundColor = UIColorFromHex(0x7c7d7f);
        self.loginBtn.userInteractionEnabled = NO;
    }
}

- (IBAction)backroundTap:(UIControl *)sender {
    [self.accountTextField resignFirstResponder];
    [self.pwdTextField resignFirstResponder];
}

- (IBAction)visibleBtnPressed:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.pwdTextField.secureTextEntry = NO;
    } else {
        self.pwdTextField.secureTextEntry = YES;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

#pragma UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    // write
    return YES;
}

@end
