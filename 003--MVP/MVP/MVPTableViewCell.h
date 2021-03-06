//
//  MVPTableViewCell.h
//  MVPDemo
//
//  Created by Cooci on 2018/3/31.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Present.h"


@interface MVPTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *subBtn;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *numLabel;

@property (nonatomic, strong) UIButton *addBtn;

@property (nonatomic, assign) int num;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, weak) id<PresentProtocol> delegate;

@end
 
