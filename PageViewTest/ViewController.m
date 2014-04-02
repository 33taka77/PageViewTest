//
//  ViewController.m
//  PageViewTest
//
//  Created by Aizawa Takashi on 2014/04/02.
//  Copyright (c) 2014年 Aizawa Takashi. All rights reserved.
//

#import "ViewController.h"
#import "PageContentViewController.h"


@interface ViewController () <UIPageViewControllerDataSource>
@property (nonatomic, retain) UIPageViewController* pageViewController;
@property (nonatomic, retain) NSArray* pageTitles;
@property (nonatomic, retain) NSArray* pageImages;
- (IBAction)startWalkthrough:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features", @"Bookmark Favorite Tip", @"Free Regular Update"];
    self.pageImages = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
    
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    PageContentViewController* startViewController = [self viewControllerAtIndex:0];
    NSArray* viewControllers = @[startViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = ((PageContentViewController*)viewController).pageIndex;
    if( (index == 0) || (index == NSNotFound) )
    {
        return nil;
    }
    index --;
    return [self viewControllerAtIndex:index];
}

- (UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = ((PageContentViewController*)viewController).pageIndex;
    if( index == NSNotFound ){
        return nil;
    }
    index ++;
    if( index >= self.pageImages.count ){
        return nil;
    }
    return [self viewControllerAtIndex:index];
}
/*
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return self.pageImages.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
*/
- (IBAction)startWalkthrough:(id)sender {
    PageContentViewController* startViewController = [self viewControllerAtIndex:0];
    NSArray* viewControllers = @[startViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if( ( self.pageTitles.count == 0 ) || ( index >= self.pageTitles.count ) ){
        return nil;
    }
    PageContentViewController* pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    return pageContentViewController;
}

@end
