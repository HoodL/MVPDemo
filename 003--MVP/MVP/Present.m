//
//  Present.m
//  003--MVP
//
//  Created by Cooci on 2018/4/1.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "Present.h"

@implementation Present

-(instancetype)init {
    if(self = [super init]) {
        [self loadData];
    }
    return self;
}

- (void)loadData{
    
    NSArray *temArray =
    @[
      @{@"name":@"Gabrielle",@"imageUrl":@"http://Gabrielle",@"num":@"25"},
      @{@"name":@"James",@"imageUrl":@"http://James",@"num":@"39"},
      @{@"name":@"Gavin",@"imageUrl":@"http://Gavin",@"num":@"7"},
      @{@"name":@"Brandon",@"imageUrl":@"http://Brandon",@"num":@"16"},
      @{@"name":@"Dean",@"imageUrl":@"http://Dean ",@"num":@"6"},
      @{@"name":@"Lucien",@"imageUrl":@"http://Lucien",@"num":@"42"},
      @{@"name":@"Howell",@"imageUrl":@"http://Howell",@"num":@"30"},
      @{@"name":@"Michelle",@"imageUrl":@"http://Michelle",@"num":@"11"},
      @{@"name":@"Quella",@"imageUrl":@"http://Quella",@"num":@"51"},
      @{@"name":@"Ulrica",@"imageUrl":@"http://Ulrica ",@"num":@"61"},
      ];
    
    for (int i = 0; i<temArray.count; i++) {
        
        Model *m = [Model modelWithDictionary:temArray[i]];
        
        [self.dataArray addObject:m];
    }
}

#pragma --mark -PresentProtocol
- (void)didClickAddBtnWithNum:(id)num indexPath:(nonnull NSIndexPath *)indexPath {
    @synchronized (self) {
        if (indexPath.row < self.dataArray.count) {
            Model *model = self.dataArray[indexPath.row];
            model.num = num;
        }
        if ([num intValue] > 10) {
            NSArray *temArray =
            @[
              @{@"name":@"CC",@"imageUrl":@"http://CC",@"num":@"9"},
              @{@"name":@"James",@"imageUrl":@"http://James",@"num":@"9"},
              ];
            [self.dataArray removeAllObjects];
            for (int i = 0; i<temArray.count; i++) {
                Model *m = [Model modelWithDictionary:temArray[i]];
                [self.dataArray addObject:m];
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(reloadUI)]) {
                [self.delegate reloadUI];
            }
        }
    }
}

#pragma mark - LAZY
-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}

@end
