//
//  PageContentViewController.h
//  PageViewTest
//
//  Created by Aizawa Takashi on 2014/04/02.
//  Copyright (c) 2014年 Aizawa Takashi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@end
