//
//  HomeCell.m
//  TableView折叠展开
//
//  Created by 苗建浩 on 2017/6/24.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()
@property (nonatomic, strong) UILabel *homeLabel;


@end

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *homeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 50)];
        homeLabel.text = @"北京";
        homeLabel.font = [UIFont systemFontOfSize:15];
        self.homeLabel = homeLabel;
        [self.contentView addSubview:homeLabel];
        
    }
    return self;
}


- (void)setDataDic:(NSDictionary *)dataDic{
    //    self.homeLabel.text = [NSString stringWithFormat:@"%@",dataDic[@"name"]];
}

- (void)setDataRowModel:(HomeRowModel *)dataRowModel{
    self.homeLabel.text = [NSString stringWithFormat:@"%@",dataRowModel.name];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
