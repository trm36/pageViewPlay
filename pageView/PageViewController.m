//
//  PageViewController.m
//  pageView
//
//  Created by Taylor Mott on 9.3.2015.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "PageViewController.h"
#import "RedViewController.h"
#import "BlueViewController.h"
#import "YellowViewController.h"

@interface PageViewController () <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) RedViewController *redVC;
@property (strong, nonatomic) BlueViewController *blueVC;
@property (strong, nonatomic) YellowViewController *yellowVC;

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.redVC = [RedViewController new];
    self.blueVC = [BlueViewController new];
    self.yellowVC = [YellowViewController new];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageViewController.dataSource = self;
    
    [self.pageViewController setViewControllers:@[self.blueVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.pageViewController didMoveToParentViewController:self];
    [self.view addSubview:self.pageViewController.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if (viewController == self.redVC) {
        return nil;
    } else if (viewController == self.blueVC) {
        return self.redVC;
    } else {
        return self.blueVC;
    }
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if (viewController == self.redVC) {
        return self.blueVC;
    } else if (viewController == self.blueVC) {
        return self.yellowVC;
    } else {
        return nil;
    }
    
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
