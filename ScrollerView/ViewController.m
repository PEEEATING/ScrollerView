//
//  ViewController.m
//  ScrollerView
//
//  Created by EATING on 2016/12/31.
//  Copyright © 2016年 EATING. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIPageControl *point;
    UIScrollView *scroll;
}

@property (nonatomic,strong) NSString *lb_num;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Image Show";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"arrow_left.png"] style:UIBarButtonItemStylePlain target:self action:(@selector(arrow_left_event))];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"arrow_rihgt.png"] style:UIBarButtonItemStylePlain target:self action:(@selector(arrow_rihgt_event))];
    
    scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    scroll.backgroundColor = [UIColor grayColor];
    scroll.contentSize = CGSizeMake(320*4, 568);
    for (int i = 1; i<=4; i++){
        NSString *name = [NSString stringWithFormat:@"image_%d.jpg",i];
        UIImage *img = [UIImage imageNamed:name];
        UIImageView *img_view = [[UIImageView alloc]initWithFrame:CGRectMake(320*(i-1), 0, 320, 568)];
        img_view.image = img;
        [scroll addSubview:img_view];
    }
    
    
    //display by page
    scroll.pagingEnabled = YES;
    //display bounces
    scroll.bounces = NO;
    //scroll bar
    scroll.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    scroll.showsHorizontalScrollIndicator = YES;
    scroll.showsVerticalScrollIndicator = YES;
    //set the default location
    scroll.contentOffset = CGPointMake(640, 0);
    
    //delegate
    scroll.delegate = self;

    [self.view addSubview:scroll];
    
    //page control
    point = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 518, 320, 50)];
    point.numberOfPages = 4 ;
    point.currentPageIndicatorTintColor = [UIColor blueColor];
    [point addTarget:self action:@selector(point_event:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:point];
}

-(void)arrow_left_event
{
    NSLog(@"left_button have been pressed");
    
    
    secondViewController *second = [[secondViewController alloc]init];
    [self.navigationController pushViewController:second animated:YES ] ;
    
    

}

-(void)arrow_rihgt_event
{

}

-(void)point_event: (UIPageControl *)p
{
    [scroll setContentOffset:CGPointMake(320*p.currentPage, 0)];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"begin to drag");
    
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"end the drag");
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"beging to decelerate");
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"end to decelerate");
    int page = (int) scrollView.contentOffset.x/320;
    point.currentPage = page;
    NSLog(@"%d",page+1);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
