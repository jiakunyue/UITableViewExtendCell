//
//  ViewController.m
//  UITableView展开缩放
//
//  Created by Justin on 2017/6/15.
//  Copyright © 2017年 jerei. All rights reserved.
//

#import "ViewController.h"
#import "CustomHeaderFooterView.h"
#import "ClassModel.h"
#import "StudentModel.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CustomHeaderFooterViewDelegate>
/** tableview */
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray  *classModels;
@end

@implementation ViewController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createDatas];
    
    [self createNavgation];
    
    [self createTableView];
}

#pragma mark - 页面布局
- (void)createNavgation {
    self.title = @"UITableView展开动画";
}

- (void)createTableView {
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [tableview registerClass:[CustomHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"CustomHeaderFooterView"];
    
    [self.view addSubview:tableview];
    self.tableview = tableview;
}

#pragma mark - 数据源相关
- (void)createDatas {
    
    NSArray *datas = @[@{@"className" : @"Aitna",
                         @"students"  : @[@{@"name" : @"J.X.T.",   @"age" : @(27)},
                                          @{@"name" : @"Leif",     @"age" : @(12)},
                                          @{@"name" : @"Lennon",   @"age" : @(23)},
                                          @{@"name" : @"Lambert",  @"age" : @(19)},
                                          @{@"name" : @"Jerome",   @"age" : @(19)},
                                          @{@"name" : @"Isidore",  @"age" : @(19)}]},
                       @{@"className" : @"Melete",
                         @"students"  : @[@{@"name" : @"Merle",    @"age" : @(34)},
                                          @{@"name" : @"Paddy",    @"age" : @(31)},
                                          @{@"name" : @"Perry",    @"age" : @(10)},
                                          @{@"name" : @"Philip",   @"age" : @(39)}]},
                       @{@"className" : @"Aoede",
                         @"students"  : @[@{@"name" : @"Verne",    @"age" : @(34)},
                                          @{@"name" : @"Vincent",  @"age" : @(78)},
                                          @{@"name" : @"Walter",   @"age" : @(43)},
                                          @{@"name" : @"Zachary",  @"age" : @(21)}]},
                       @{@"className" : @"Dione",
                         @"students"  : @[@{@"name" : @"Timothy",  @"age" : @(98)},
                                          @{@"name" : @"Roderick", @"age" : @(21)},
                                          @{@"name" : @"Quentin",  @"age" : @(7)},
                                          @{@"name" : @"Paddy",    @"age" : @(67)}]},
                       @{@"className" : @"Adanos",
                         @"students"  : @[@{@"name" : @"Mortimer", @"age" : @(23)},
                                          @{@"name" : @"Michael",  @"age" : @(45)},
                                          @{@"name" : @"Kevin",    @"age" : @(89)},
                                          @{@"name" : @"Jeremy",   @"age" : @(23)}]},];
    
    self.classModels = [[NSMutableArray alloc] init];
    for (int count = 0; count < datas.count; count++) {
        
        ClassModel *classModel = [[ClassModel alloc] initWithDictionary:datas[count]];
        classModel.expend = YES;
        
        [self.classModels addObject:classModel];
    }
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CustomHeaderFooterView *titleView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"CustomHeaderFooterView"];
    titleView.delegate = self;
    titleView.section = section;
    
    ClassModel *model = _classModels[section];
    titleView.normalClassNameLabel.text = model.className;
    
    return titleView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _classModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ClassModel *model = _classModels[section];
    
    if (model.expend == NO) {
    
        return model.students.count;
        
    } else {
        
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    ClassModel *model = _classModels[indexPath.section];
    StudentModel *student = model.students[indexPath.row];
    
    cell.textLabel.text = student.name;
    return cell;
}

#pragma mark - CustomHeaderFooterViewDelegate
- (void)customHeaderFooterView:(CustomHeaderFooterView *)customHeaderFooterView event:(id)event {
    NSInteger section = customHeaderFooterView.section;
    ClassModel *model = _classModels[section];

    NSMutableArray *indexPaths = [NSMutableArray array];
    for (int i = 0; i < model.students.count; i++) {
        
        [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
    }
    if (model.expend == NO) {
        model.expend = !model.expend;
        [self.tableview deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    } else {
        model.expend = !model.expend;
        [self.tableview insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
    
}

@end
