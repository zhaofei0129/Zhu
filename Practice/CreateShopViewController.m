//
//  CreateShopViewController.m
//  Practice
//
//  Created by zhaofei on 2017/4/4.
//  Copyright © 2017年 ZhaoFei. All rights reserved.
//

#import "CreateShopViewController.h"
#import "Defines.h"

@interface CreateShopViewController ()

@property (weak, nonatomic) IBOutlet UILabel *noShopLabel;
@property (weak, nonatomic) IBOutlet UIButton *createShopBtn;
@property (weak, nonatomic) IBOutlet UIButton *joinShopBtn;

@end

@implementation CreateShopViewController

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
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//    [rightBtn setTitleColor:UIColorFromHex(0x4a4a4b) forState:UIControlStateNormal];
//    [rightBtn setTitle:@"退出" forState:UIControlStateNormal];
//    [rightBtn sizeToFit];
//    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
//    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
    NSDictionary *titleTextAttributes = @{
                                 NSFontAttributeName: [UIFont systemFontOfSize:14],
                                 NSForegroundColorAttributeName: UIColorFromHex(0x4a4a4b)
                                 };
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    
    // draw view
    self.view.backgroundColor = UIColorFromHex(0xf4f5f7);
    
    // draw noShopLabel
    self.noShopLabel.textColor = UIColorFromHex(0x939393);
    
    // draw createShopBtn
    [self.createShopBtn setTitleColor:UIColorFromHex(0xffffff) forState:UIControlStateNormal];
    self.createShopBtn.backgroundColor = UIColorFromHex(0x00be00);
    self.createShopBtn.layer.masksToBounds = YES;
    self.createShopBtn.layer.cornerRadius = 2.0;
    
    // draw joinShopBtn
    [self.joinShopBtn setTitleColor:UIColorFromHex(0x00be00) forState:UIControlStateNormal];
    CALayer *layer = self.joinShopBtn.layer;
    layer.masksToBounds = YES;
    layer.cornerRadius = 2.0;
    layer.borderWidth = 1.0;
    layer.borderColor = UIColorFromHex(0x00be00).CGColor;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createShopBtnPressed:(UIButton *)sender {
    sender.backgroundColor = UIColorFromHex(0x00be00);
    NSLog(@"createShopBtnPressed");
}

- (IBAction)createShopBtnPressedHighlight:(UIButton *)sender {
    sender.backgroundColor = UIColorFromHex(0x00ab00);
}

- (IBAction)joinShopBtnPressed:(UIButton *)sender {
    sender.layer.borderColor = UIColorFromHex(0x00be00).CGColor;
    NSLog(@"joinShopBtnPressed");
}

- (IBAction)joinShopBtnPressedHighlight:(UIButton *)sender {
    sender.layer.borderColor = UIColorFromHex(0x00ab00).CGColor;
}
- (IBAction)exitBtnPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}



@end
