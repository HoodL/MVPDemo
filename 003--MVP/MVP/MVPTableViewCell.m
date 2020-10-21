//
//  MVPTableViewCell.m
//  MVPDemo
//
//  Created by Cooci on 2018/3/31.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "MVPTableViewCell.h"
#import <Masonry.h>

@implementation MVPTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        make.left.mas_equalTo(20);
    }];
    
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        make.right.mas_equalTo(-50);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
    }];
    
    
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.addBtn.mas_left);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    
    
    [self.subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.numLabel.mas_left);
        make.size.centerY.equalTo(self.addBtn);
        
    }];
    
}

- (void)setupUI{
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"Cooci";
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.font = [UIFont systemFontOfSize:20];
    self.nameLabel.textColor = [UIColor orangeColor];
    [self.contentView addSubview:self.nameLabel];
    
    self.subBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.subBtn];
    [self.subBtn setTitle:@" - " forState:UIControlStateNormal];
    [self.subBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.subBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.subBtn setBackgroundColor:[UIColor blueColor]];
    [self.subBtn addTarget:self action:@selector(didClickSubBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.subBtn.layer.cornerRadius = 15;
    self.subBtn.layer.masksToBounds = YES;
    self.subBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;

    
    self.numLabel = [[UILabel alloc] init];
    self.numLabel.text = @"0";
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    self.numLabel.font = [UIFont systemFontOfSize:20];
    self.numLabel.textColor = [UIColor redColor];
    [self.contentView addSubview:self.numLabel];
    
    
    
    
    self.addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.addBtn];
    [self.addBtn setTitle:@" + " forState:UIControlStateNormal];
    [self.addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.addBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.addBtn setBackgroundColor:[UIColor blueColor]];
    [self.addBtn addTarget:self action:@selector(didClickAddBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.addBtn.layer.cornerRadius = 15;
    self.addBtn.layer.masksToBounds = YES;
    self.addBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    self.num = 0;
}


#pragma mark - Action

- (void)didClickSubBtn:(UIButton *)sender{
    
    if ([self.numLabel.text intValue]<=0) {return;}
    
    self.num--;
  
    

}

- (void)didClickAddBtn:(UIButton *)sender{
    
    if ([self.numLabel.text intValue]>=200) {return;}
    
    self.num++;
    

    
}


#pragma mark - set


- (void)setNum:(int)num{
    
    _num = num;
    
    self.numLabel.text = [NSString stringWithFormat:@"%d",self.num];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickAddBtnWithNum:indexPath:)]) {
        [self.delegate didClickAddBtnWithNum:self.numLabel.text indexPath:self.indexPath];
    }
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
