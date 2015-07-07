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
    
    return @[@{@"git status": @"  shows changed files"},
             @{@"git diff": @"  shows actual changes"},
             @{@"git add .": @"  adds changed files to the commit"},
             @{@"git commit -m \"notes\"": @"  commits the changes"},
             @{@"git push origin _branch_": @"  pushes commits to branch named _branch_"},
             @{@"git log": @"  displays progress log"},
             @{@"git comment --amend": @"  re-enter last commit message"}
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
    
    UIScrollView *myListView = [[UIScrollView alloc] initWithFrame:CGRectMake (10, 64, 300, 600)];
    myListView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:myListView];
    
    self.title = @"Git Title";
    
    CGFloat y = 0;
    CGFloat h;
    
    for (NSDictionary* d in [self gitCommands]) {
        for (NSString *command in d) {
            
            UILabel *commandLabel = [UILabel new];
            h = [self heightOfReferenceString:command];
            commandLabel.frame = CGRectMake(0, y, 300, h);
            commandLabel.backgroundColor = [UIColor greenColor];
            commandLabel.text = command;
            commandLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
            commandLabel.lineBreakMode = 0;
            [myListView addSubview:commandLabel];
            
            y = y + h;
            
            UILabel *referenceLabel = [UILabel new];
            h = [self heightOfReferenceString:d[command]];
            referenceLabel.frame = CGRectMake(0, y, 300, h);
            referenceLabel.backgroundColor = [UIColor redColor];
            referenceLabel.text = d[command];
            referenceLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
            referenceLabel.lineBreakMode = 5;
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
