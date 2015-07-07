//
//  ReferenceListViewController.m
//  GitReference
//
//  Created by Rutan on 7/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ReferenceListViewController.h"

@interface ReferenceListViewController ()

@end

@implementation ReferenceListViewController

static CGFloat margin = 15;


- (NSArray *)gitCommands {
    
    return @[@{@" git ahead": @"   successfully commit changes before anyone else"},
             @{@" git along": @"   having no conflicts when merging branches"},
             @{@" git even": @"   push back to someone who pushed to you first"},
             @{@" git it": @"   when the changes finally make sense"},
             @{@" git it together": @"   making some long overdue commits, pulls, or pushes"},
             @{@" git lost": @"   sending your entire repository to the trash bin after hours of frustration"},
             @{@" git over": @"   undoing a commit and leaving a branch that just didn't work out"},
             @{@" git r done": @"   finish the project, already!!"},
             ];
    
}

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                              context:nil];
    
    return bounding.size.height;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *myListView = [[UIScrollView alloc] initWithFrame:CGRectMake (10, 0, 300, 600)];
    myListView.contentSize = CGSizeMake(300, 665);

    [self.view addSubview:myListView];
    
    self.title = @"Git Reference Guide";
    
    CGFloat y = 0;
    CGFloat h;
    
    for (NSDictionary* d in [self gitCommands]) {
        for (NSString *command in d) {
            
            UILabel *commandLabel = [UILabel new];
            h = [self heightOfReferenceString:command]+10;
            commandLabel.frame = CGRectMake(0, y, 300, h);
            commandLabel.backgroundColor = [UIColor cyanColor];
            commandLabel.text = command;
            commandLabel.font = [UIFont boldSystemFontOfSize:16];
            [myListView addSubview:commandLabel];
            
            y = y + h;
            
            UILabel *referenceLabel = [UILabel new];
            h = [self heightOfReferenceString:d[command]]+20;
            referenceLabel.frame = CGRectMake(0, y, 300, h);
            referenceLabel.numberOfLines = 0;
            referenceLabel.backgroundColor = [UIColor lightGrayColor];
            referenceLabel.text = d[command];
            referenceLabel.font = [UIFont systemFontOfSize:16];
            [myListView addSubview:referenceLabel];
            
            y = y + h;
            
            
        }
        
    }
    
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
