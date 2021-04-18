//
//  ListTableViewCell.m
//  ModulesDemo
//
//  Created by 刘冲 on 2021/1/16.
//  Copyright © 2021 lc. All rights reserved.
//

#import "ListTableViewCell.h"
@import Masonry;

@implementation ListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.viewCountLabel = [UILabel new];
        self.viewCountLabel.textColor = UIColor.greenColor;
        [self.contentView addSubview:self.viewCountLabel];
        
        [self.viewCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    
    return self;
}

@end
