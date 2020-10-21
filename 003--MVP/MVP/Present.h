//
//  Present.h
//  003--MVP
//
//  Created by Cooci on 2018/4/1.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import <YYKit.h>
#import "PresentProtocol.h"


@interface Present : NSObject <PresentProtocol>
@property(strong, nonatomic) NSMutableArray *dataArray;
@property(weak, nonatomic) id<PresentProtocol> delegate;
@end
