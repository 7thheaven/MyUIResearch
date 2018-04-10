//
//  ViewController.m
//  UIResearch
//
//  Created by July on 2018/4/4.
//  Copyright © 2018年 July. All rights reserved.
//

#import "ViewController.h"
#import "URView.h"

@interface ViewController ()

@property (nonatomic, strong) URView *urView;

@end

@implementation ViewController

- (URView *)urView
{
    if (!_urView) {
        _urView = [URView new];
    }
    return _urView;
}

- (void)loadView
{
    self.view = self.urView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
