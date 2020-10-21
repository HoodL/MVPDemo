//
//  LMDataSource.h
//  LMShopCart
//
//  Created by Cooci on 2018/3/29.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CellConfigureBefore)(id cell, id model, NSIndexPath * indexPath);


@interface LMDataSource : NSObject<UITableViewDataSource,UICollectionViewDataSource>

@property (nonatomic, strong)  NSMutableArray *dataArray;;

//自定义
- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before;

//sb
@property (nonatomic, strong) IBInspectable NSString *cellIdentifier;

@property (nonatomic, copy) CellConfigureBefore cellConfigureBefore;



- (void)addDataArray:(NSArray *)datas;

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath;

@end
