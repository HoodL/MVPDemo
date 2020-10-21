//
//  PresentProtocol.h
//  003--MVP
//
//  Created by 李辉 on 2020/8/22.
//  Copyright © 2020 Cooci. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PresentProtocol <NSObject>
@optional
//UI -----> model 意义 model.num = num
-(void)didClickAddBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath;
//数据发生变化 ---reloadUI
-(void)reloadUI;
@end

NS_ASSUME_NONNULL_END
