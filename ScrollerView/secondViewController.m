//
//  secondViewController.m
//  ScrollerView
//
//  Created by EATING on 2017/1/1.
//  Copyright © 2017年 EATING. All rights reserved.
//

#import "secondViewController.h"
#import "ViewController.h"
@interface secondViewController ()
{

}

@property (nonatomic,strong) NSString *lb_num;

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(70, 180, 240, 50)];
    [lb setText:@"Which page do you jump"];
    
    UITextField * tf = [[UITextField alloc]initWithFrame:CGRectMake(80, 100, 160, 50)];
    tf.clearButtonMode = UITextFieldViewModeAlways;
    tf.keyboardType = UIKeyboardTypeNumberPad ;
    tf.placeholder = @"input the number";
    tf.backgroundColor = [UIColor grayColor];
    tf.borderStyle = UITextBorderStyleRoundedRect ;
    tf.backgroundColor = [UIColor whiteColor];
    [tf setReturnKeyType:UIReturnKeyDone];
    
    
    
    self.navigationItem.title = @"Jump";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrow_left.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back_rootView)] ;
    

    //NSString *page_num = ;
    
    [self.view addSubview:lb];
    [self.view addSubview:tf];
    
}

-(void)back_rootView
{
    
    [self.navigationController popViewControllerAnimated:YES];
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
