//
//  ProfileRootViewController.m
//  NativeStorage
//
//  Created by warner on 10/25/15.
//  Copyright © 2015 warner. All rights reserved.
//

#import "ProfileRootViewController.h"

@interface ProfileRootViewController (){
    UIButton *okButton;
}

@end

@implementation ProfileRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    okButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 80, 80)];
    [okButton setTitle:@"show" forState:UIControlStateNormal];
    [okButton setBackgroundColor:[UIColor greenColor]];
    [okButton addTarget:self action:@selector(showVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showVC:(id)sender{
    
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
