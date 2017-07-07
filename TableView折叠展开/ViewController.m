//
//  ViewController.m
//  TableView折叠展开
//
//  Created by 苗建浩 on 2017/6/24.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ViewController.h"
#import "HomeCell.h"
#import "HomeModel.h"
#import "Header.h"
#import "HomeRowModel.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *homeTable;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSArray *arr;
@property (nonatomic, assign) int number;
@property (nonatomic, strong) UIButton *seleBtn;
@property (nonatomic, strong) NSMutableArray *dataRowArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.dataArr = [NSMutableArray array];
    self.dataRowArr = [NSMutableArray array];
    self.arr = [NSArray array];
    
    
    _arr = @[@{@"text":@"地区",@"index":@0,@"list":@[@{@"name":@"北京"},@{@"name":@"上海"},@{@"name":@"天津"}]},
             @{@"text":@"人物",@"index":@0,@"list":@[@{@"name":@"小张"},@{@"name":@"小明"}]},
             @{@"text":@"时间",@"index":@0,@"list":@[@{@"name":@"今天"},@{@"name":@"昨天"}]},
             @{@"text":@"年龄",@"index":@0,@"list":@[@{@"name":@"20"},@{@"name":@"18"}]},
             @{@"text":@"属性",@"index":@0,@"list":@[@{@"name":@"属狗"},@{@"name":@"属鸡"}]},
             @{@"text":@"性别",@"index":@0,@"list":@[@{@"name":@"男"},@{@"name":@"男"}]},
             @{@"text":@"工作",@"index":@0,@"list":@[@{@"name":@"公务员"},@{@"name":@"白领"}]},
             @{@"text":@"身高",@"index":@0,@"list":@[@{@"name":@"177"},@{@"name":@"179"}]}];
    
    for (NSDictionary *dic in _arr) {
        
        [self.dataArr addObject:[HomeModel modelWithDict:dic]];
    }
    
    
    UITableView *homeTable = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVGATION_ADD_STATUS_HEIGHT, screenWidth, screenHight - NAVGATION_ADD_STATUS_HEIGHT) style:UITableViewStyleGrouped];
    homeTable.delegate = self;
    homeTable.dataSource = self;
    homeTable.tableFooterView = [[UIView alloc] init];
    self.homeTable = homeTable;
    [self.view addSubview:homeTable];
}


#pragma mark -----UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 80)];
    headView.backgroundColor = [UIColor whiteColor];
    
    HomeModel *model = _dataArr[section];
    
    UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 60)];
    headLabel.text = [NSString stringWithFormat:@"%@",model.text];
    [headView addSubview:headLabel];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((screenWidth - 80) / 2, 20, 80, 40);
    button.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    [button setTitle:@"展开" forState:UIControlStateNormal];
    [button setTitle:@"关闭" forState:UIControlStateSelected];
    button.tag = 1000 + section;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:button];
    
    button.selected = (int)model.index;
    
    return headView;
}


//  cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    HomeModel *model = _dataArr[section];
    if (model.index == 1) return model.list.count;
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeCell *cell = [HomeCell creatCellWithTableView:tableView];
    cell.dataDic = _arr[indexPath.section][@"list"][indexPath.row];
    cell.dataRowModel = _dataRowArr[indexPath.row];
    return cell;
}


- (void)buttonClick:(UIButton *)sender{
    if (_seleBtn != nil) {
        _seleBtn.selected = NO;
        NSInteger seleIndex = _seleBtn.tag - 1000;
        HomeModel *model = _dataArr[seleIndex];
        model.index = 0;
        [self.dataRowArr removeAllObjects];
        for (NSDictionary *dic in model.list) {
            [self.dataRowArr addObject:[HomeRowModel modelWithDict:dic]];
        }
    }
    sender.selected = !sender.selected;
    _seleBtn = sender;
    NSInteger index = sender.tag - 1000;
    HomeModel *model = _dataArr[index];
    model.index = sender.selected;
    
    
    [self.dataRowArr removeAllObjects];
    for (NSDictionary *dic in model.list) {
        [self.dataRowArr addObject:[HomeRowModel modelWithDict:dic]];
    }
    [_homeTable reloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
