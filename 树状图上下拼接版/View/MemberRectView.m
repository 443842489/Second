//
//  MemberRectView.m
//  smarket
//
//  Created by ym on 17/5/10.
//  Copyright © 2017年 飞扬软件. All rights reserved.
//

#import "MemberRectView.h"
#import "Masonry.h"
#import "ConstantDefine.h"
@interface MemberRectView()
@property(nonatomic,assign)CGFloat startX;//竖线的参照X坐标
@property(nonatomic,assign)CGFloat leftLineX;
@property(nonatomic,assign)CGFloat rightLineX;
@end
@implementation MemberRectView

-(instancetype)initWithMemberModel:(MyMemberModel*)model andIsup:(BOOL)isup;
{
    self = [super init];
    if (self) {
        self.menberView.model=model;
        self.isup=isup;
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.startX=0;
    [self addSubview:self.menberView];
    
    [self.menberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(HeadWidth);
        make.height.mas_equalTo(HeadHeight);
    }];
    
    if(self.isup==YES)
    {
        self.yBottomLine=[[View alloc]init];//底部的那根竖线
        self.yBottomLine.backgroundColor=[UIColor blackColor];
        [self addSubview:self.yBottomLine];
        [self.yBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.top.mas_equalTo(self.menberView.mas_bottom);
            make.width.mas_equalTo(1);
            make.height.mas_equalTo(YSpace/2);
        }];
        
        if(self.menberView.model.parent.count>0)
        {
            //要画竖向分支线(有多少个分支，画多少条竖线。包括分支源头的那根竖线)
            
            self.yFromLine=[[View alloc]init];//上面的那根竖线
            self.yFromLine.backgroundColor=[UIColor blueColor];
            [self addSubview:self.yFromLine];
            [self.yFromLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self.mas_centerX);
                make.bottom.mas_equalTo(self.menberView.mas_top);
                make.width.mas_equalTo(1);
                make.height.mas_equalTo(YSpace/2);
            }];
     
        }else{
//            self.yFromLine.hidden=YES;
        }
    }else{
        
        self.yFromLine=[[View alloc]init];//上面的那根竖线
        self.yFromLine.backgroundColor=[UIColor blackColor];
        [self addSubview:self.yFromLine];
        [self.yFromLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.bottom.mas_equalTo(self.menberView.mas_top);
            make.width.mas_equalTo(1);
            make.height.mas_equalTo(YSpace/2);
        }];
        
        if(self.menberView.model.children.count>0)
        {
            self.yBottomLine=[[View alloc]init];//底部的那根竖线
            self.yBottomLine.backgroundColor=[UIColor blackColor];
            [self addSubview:self.yBottomLine];
            [self.yBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self.mas_centerX);
                make.top.mas_equalTo(self.menberView.mas_bottom);
                make.width.mas_equalTo(1);
                make.height.mas_equalTo(YSpace/2);
            }];
        }
    }
    
}


- (MyMemberView *)menberView {
	if (_menberView == nil) {
        _menberView = [[MyMemberView alloc] init];
	}
	return _menberView;
}

@end





