//
//  YDPlanCell.m
//  JoyfulSports
//
//  Created by 谢琛 on 14/10/10.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDPlanCell.h"
#import "YDCellItem.h"
#import "YDCellLabelItem.h"
@interface YDPlanCell()

@property (nonatomic, weak) UIView *divider;

/**
 *  右边文本标签
 */
@property (nonatomic, strong) UILabel *accessoryLabel;
@end

@implementation YDPlanCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.设置lable字体大小
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.textLabel.textColor = [UIColor whiteColor];
        self.detailTextLabel.font = [UIFont systemFontOfSize:11];
        self.detailTextLabel.textColor = [UIColor whiteColor];
        
        
        // backgroundView 的优先级高度 backgroundColor
        // 设置默认状态的背景图片
        UIImageView *bgIv = [[UIImageView alloc ] init];
        self.backgroundView = bgIv;
        // 设置选中状态的背景图片
        UIImageView *selBgIv = [[UIImageView alloc ] init];
        self.selectedBackgroundView = selBgIv;
        // 清空背景颜色
        self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        UIView *divider = [[UIView alloc]init];
        divider.backgroundColor = [UIColor grayColor];
        divider.alpha = .3f;
        [self addSubview:divider];
        self.divider = divider;
    }
    return self;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"common";
    YDPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YDPlanCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}
- (void)setItem:(YDCellItem *)item
{
    _item = item;
    
    // 设置数据
    
    // 3.设置cell显示的数据为模型数据
    self.imageView.image = [UIImage imageWithName:item.icon];
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subtitle;
    
    // 设置右边显示的内容
    [self setupRightView];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.detailTextLabel.x = CGRectGetMaxX(self.textLabel.frame) + 10;
    if (self.hideDivider) {
        [self.divider setHidden:YES];
    }
    
    
    CGFloat dW = 0.f;
    if (self.imageView == nil) {
        dW = self.frame.size.width;
    } else {
        dW = self.frame.size.width - self.imageView.frame.size.width;
    }
    //    设置frame
    CGFloat dX = CGRectGetMaxX(self.imageView.frame ) + 10.f;
    
    CGFloat dH = .3f;
    CGFloat dY = self.contentView.frame.size.height - dH;
    self.divider.frame = CGRectMake(dX, dY, dW, dH);
    NSLog(@"view:%@", NSStringFromCGRect(self.frame));
    NSLog(@"contentView:%@", NSStringFromCGRect(self.contentView.frame));
}
- (void)setupRightView
{
    if ([self.item isKindOfClass:[YDCellLabelItem class]]) {
        
        // 显示lable
        self.accessoryView = self.accessoryLabel;
        YDCellLabelItem *item = (YDCellLabelItem *)self.item;
        self.accessoryLabel.text = item.text;
        // 计算label的size
        self.accessoryLabel.size = [item.text sizeWithFont:self.accessoryLabel.font];
        
 
    }else
    {
        // 注意重复利用问题
        self.accessoryView = nil;
    }
}
- (void)setNSIndexPath:(NSIndexPath *)indexPath totals:(NSInteger)totals
{
    
    // 判断当前对应的行号, 设置对应的背景图片
    UIImageView *bgIv = (UIImageView *)self.backgroundView;
    UIImageView *selBgIv = (UIImageView *)self.selectedBackgroundView;
    
    // 1.判断当前组有多少行
    if (1 == totals) {
        //bgIv.image = [UIImage resizableImageWithName:@"common_card_bottom_background"];
        selBgIv.image = [UIImage resizableImageWithName:@"highlighted"];
        
    }else if (0 == indexPath.row) {
        // 证明是第0行
       // bgIv.image = [UIImage resizableImageWithName:@"common_card_top_background"];
        selBgIv.image = [UIImage resizableImageWithName:@"highlighted"];
    }else if ((totals - 1) == indexPath.row)
    {
        // 证明是最后一行
        //bgIv.image = [UIImage resizableImageWithName:@"common_card_bottom_background"];
        selBgIv.image = [UIImage resizableImageWithName:@"highlighted"];
    }else
    {
        // 证明是中间那
        //bgIv.image = [UIImage resizableImageWithName:@"common_card_middle_background"];
        selBgIv.image = [UIImage resizableImageWithName:@"highlighted"];
    }
    
}

- (void)setFrame:(CGRect)frame
{
    
    if (!iOS7) {
        // 水平方向移动cell
        frame.origin.x -= 10;
        // 拉伸cell的宽度
        frame.size.width += 20;
    }
    [super setFrame:frame];
}
- (UILabel *)accessoryLabel
{
    if (!_accessoryLabel) {
        _accessoryLabel = [[UILabel alloc] init];
        _accessoryLabel.font = [UIFont systemFontOfSize:12];
        _accessoryLabel.textColor = [UIColor grayColor];
    }
    return _accessoryLabel;
}
@end
