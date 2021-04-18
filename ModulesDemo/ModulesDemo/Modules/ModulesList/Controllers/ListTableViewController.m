//
//  ListTableViewController.m
//  ModulesDemo
//
//  Created by 刘冲 on 2021/1/16.
//  Copyright © 2021 lc. All rights reserved.
//

#import "ListTableViewController.h"
#import "ListModel.h"
#import "ListTableViewCell.h"

//#import "VideoDetailViewController.h"

@import MDHud;

@interface ListTableViewController ()

@property (nonatomic, strong) NSMutableArray *models;

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showHudLoading];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHudLoading];
        self.models = [NSMutableArray array];
        
        for (int index = 0; index < 10; index++) {
            ListModel *model = [ListModel new];
            model.ID = [NSString stringWithFormat:@"%d", index];
            model.count = [NSString stringWithFormat:@"%d", index + 100];
            
            [self.models addObject:model];
        }
        
        [self.tableView reloadData];
    });
    
    
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    ListModel *model = self.models[indexPath.row];
    cell.viewCountLabel.text = [NSString stringWithFormat:@"播放数量 = %@", model.count];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    ListModel *model = self.models[indexPath.row];
//    VideoDetailViewController *vc = [VideoDetailViewController new];
//    vc.ID = model.ID;
//    vc.count = model.count;
//    __weak typeof(model) weakModel = model;
//    __weak typeof(self) weakSelf = self;
//    vc.videoDetailPlayBlock = ^(NSString * _Nonnull ID, NSString * _Nonnull count) {
//        weakModel.count = count;
//
//        [weakSelf.tableView reloadData];
//    };
//    [self.navigationController pushViewController:vc animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
