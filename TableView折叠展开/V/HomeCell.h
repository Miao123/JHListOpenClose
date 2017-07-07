//
//  HomeCell.h
//  TableView折叠展开
//
//  Created by 苗建浩 on 2017/6/24.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "BasicTableViewCell.h"
#import "HomeModel.h"
#import "HomeRowModel.h"


@interface HomeCell : BasicTableViewCell

@property (nonatomic, strong) NSDictionary *dataDic;

@property (nonatomic, strong) HomeRowModel *dataRowModel;

@end
