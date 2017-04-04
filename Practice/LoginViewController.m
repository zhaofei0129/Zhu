//
//  LoginViewController.m
//  Practice
//
//  Created by zhaofei on 2017/4/1.
//  Copyright © 2017年 ZhaoFei. All rights reserved.
//

#import "LoginViewController.h"
#import "Defines.h"

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

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    // draw forgetPwdBtn & registerBtn &registerLabel
    [self.forgetPwdBtn setTitleColor:UIColorFromHex(0x939393) forState:UIControlStateNormal];
    [self.registerBtn setTitleColor:UIColorFromHex(0x00be00) forState:UIControlStateNormal];
    self.registerLabel.textColor = UIColorFromHex(0x939393);
    
    // draw accountTextField & pwdTextField
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

- (IBAction)clearBtnPressed:(UIButton *)sender {
    self.accountTextField.text = @"";
    sender.hidden = YES;
}

- (void)textChange:(NSNotification *)notification {
    UITextField *textField = notification.object;
    if (textField.text.length == 0) {
        self.clearBtn.hidden = YES;
    } else {
        self.clearBtn.hidden = NO;
    }
}

- (IBAction)backroundTap:(UIControl *)sender {
    [self.accountTextField resignFirstResponder];
    [self.pwdTextField resignFirstResponder];
}

- (IBAction)visibleBtnPressed:(UIButton *)sender {
//    sender.selected = !sender.selected;
//    if (!sender.selected) {
//        self.pwdTextField.secureTextEntry = !self.pwdTextField.secureTextEntry;
//    }
}

#pragma UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    NSLog(@"textFieldShouldReturn");
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.accountTextField) {
        NSLog(@"textFieldShouldBeginEditing -- accountTextField");
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:textField];
        [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:textField];
    } else {
        NSLog(@"textFieldShouldBeginEditing -- pwdTextField");
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:textField];
        [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:textField];
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField == self.accountTextField) {
        NSLog(@"textFieldShouldEndEditing -- accountTextField");
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:textField];
    } else {
        NSLog(@"textFieldShouldEndEditing -- pwdTextField");
    }
    return YES;
}

@end
