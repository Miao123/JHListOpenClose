//
//  HomeModel.h
//  TableView折叠展开
//
//  Created by 苗建浩 on 2017/6/24.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "BasicModel.h"

@interface HomeModel : BasicModel
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *count;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) BOOL isSelecd;

@end

