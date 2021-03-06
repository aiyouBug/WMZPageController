


//
//  TitleVC.m
//  WMZPageController
//
//  Created by wmz on 2019/10/10.
//  Copyright © 2019 wmz. All rights reserved.
//

#import "TitleVC.h"
@implementation TitleVC

- (void)pushWithVC:(UIViewController *)vc withIndex:(NSInteger)index{
    //数据
    NSDictionary *dic = @{
          @(0):@"textData",
          @(1):@"lineBreakData",
          @(2):@"redTipData",
          @(3):@"attributesData",
          @(4):@"imageData",
          @(5):@"imageData",
          @(6):@"textData",
          @(7):@"textData",
          @(8):@"textData",
          @(9):@"textData",
          @(10):@"fixData",
      };
    //位置
    NSDictionary *position = @{
          @(0):@(PageMenuPositionLeft),
          @(1):@(PageMenuPositionLeft),
          @(2):@(PageMenuPositionLeft),
          @(3):@(PageMenuPositionLeft),
          @(4):@(PageMenuPositionLeft),
          @(5):@(PageMenuPositionBottom),
          @(6):@(PageMenuPositionNavi),
          @(7):@(PageMenuPositionCenter),
          @(8):@(PageMenuPositionLeft),
          @(9):@(PageMenuPositionLeft),
          @(10):@(PageMenuPositionLeft),
      };
    //菜单宽度
    NSDictionary *widthDic = @{
         @(0):@(PageVCWidth),
         @(1):@(PageVCWidth),
         @(2):@(PageVCWidth),
         @(3):@(PageVCWidth),
         @(4):@(PageVCWidth),
         @(5):@(PageVCWidth),
         @(6):@(PageVCWidth*0.6),
         @(7):@(PageVCWidth*0.7),
         @(8):@(PageVCWidth),
         @(9):@(PageVCWidth),
         @(10):@(PageVCWidth),
    };
    NSArray *data = @[];
    SuppressPerformSelectorLeakWarning(data = [self performSelector:NSSelectorFromString(dic[@(index)])]);
      
    NSMutableArray *vcArr = [NSMutableArray new];
    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TestVC *vc = [TestVC new];
        vc.page = idx;
        [vcArr addObject:vc];
    }];
    
    WMZPageParam *param = PageParam()
    .wTitleArrSet(data)
    .wControllersSet(vcArr)
    .wMenuWidthSet([widthDic[@(index)] floatValue])
    .wMenuDefaultIndexSet(2)
    .wMenuPositionSet([position[@(index)] intValue]);
    if (index == 8) {
        param.wMenuFixRightDataSet(@"≡");
    }
    if (index == 9) {
        param.wMenuImagePositionSet(PageBtnPositionLeft)
             .wMenuFixRightDataSet(@{@"name":@"金币",@"image":@"B"});
    } if (index == 10) {
        param.wMenuTitleWidthSet(PageVCWidth/data.count);
    }
    
    WMZPageController *VC =  [WMZPageController new];
    VC.param = param;
    [vc.navigationController pushViewController:VC animated:YES];
}

//普通标题
- (NSArray*)textData{
    return @[@"推荐",@"LOOK直播",@"画",@"现场",@"翻唱",@"MV",@"广场",@"游戏"];
}

//换行标题
- (NSArray*)lineBreakData{
    return @[@"推荐\n10",@"LOOK直播\n100",@"画\n1000",@"现场\n6",@"翻唱\n4",@"MV\n好看的MV",@"广场\n4",@"游戏\n30"];
}

//带红点普通标题   badge红点
- (NSArray*)redTipData{
    return @[
        @{@"name":@"推荐",@"badge":@(YES)},
        @"LOOK直播",
        @"画",
        @"现场",
        @{@"name":@"翻唱",@"badge":@(YES)},
        @"MV",
        @"广场",
        @{@"name":@"游戏",@"badge":@(YES)},
    ];
}

//带富文本  wrapColor第二行标题  firstColor第一行标题
- (NSArray*)attributesData{
    return @[
        @{@"name":@"推荐\n10",@"wrapColor":[UIColor brownColor]},
        @"LOOK直播\n10",
        @{@"name":@"画\n10",@"badge":@(YES),@"wrapColor":[UIColor purpleColor]},
        @"现场\n10",
        @{@"name":@"翻唱\n10",@"wrapColor":[UIColor blueColor],@"firstColor":[UIColor cyanColor]},
        @"MV\n10",
        @"MV\n10",
        @{@"name":@"游戏\n10",@"badge":@(YES),@"wrapColor":[UIColor yellowColor]},
    ];
}

//图片  image图片  selectImage选中图片
- (NSArray*)imageData{
    return @[
        @{@"name":@"推荐",@"image":@"B",@"selectImage":@"D"},
        @{@"name":@"LOOK直播",@"image":@"C",@"selectImage":@"D"},
        @{@"name":@"画",@"image":@"B",@"selectImage":@"D"},
        @{@"name":@"现场",@"image":@"C",@"selectImage":@"D"},
        @{@"name":@"翻唱",@"image":@"B",@"selectImage":@"D"},
        @{@"name":@"MV",@"image":@"C",@"selectImage":@"D"},
        @{@"name":@"游戏",@"badge":@(YES),@"image":@"B",@"selectImage":@"D"},
        @{@"name":@"广场",@"image":@"C",@"selectImage":@"D"},
    ];
}

//固定宽度标题
- (NSArray*)fixData{
    return @[@"推荐",@"热点",@"关注"];
}

@end
