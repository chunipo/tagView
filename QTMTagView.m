//
//  QTMTagView.m
//  QianTuMei
//
//  Created by weiyuxiang on 2018/4/20.
//  Copyright © 2018年 luwei. All rights reserved.
//

#import "QTMTagView.h"

@interface QTMTagView() <QTMTagViewDelegate>

@property (nonatomic, strong) UIScrollView    *tagScrollview;

@end

@implementation QTMTagView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame])[self setSublayout];
    return self;
}

- (void)ButtonClick:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(searchText:)])[self.delegate searchText:button.titleLabel.text];
}

- (void)setSublayout{
    [self addSubview:self.tagScrollview];
}

- (void)joinTextArray:(NSArray *)array andTitleSize:(CGFloat)TitleSize andHeight:(CGFloat)Height andTitleColor:(UIColor *)TitleColor andborderWidth:(CGFloat)borderWidth andborderColor:(UIColor *)borderColor andSpacing:(CGFloat)Spacing andkMagin:(CGFloat)kMagin andhMagin:(CGFloat)hMagin{
    int heightInt = 0;
    int previousWidth = 0;
    for (int i = 0; i<array.count; i++) {
        NSString *text = array[i];
        UIButton *button = [UIButton buttonWithTitle:text atTitleSize:TitleSize atTitleColor:TitleColor atTarget:self atAction:@selector(ButtonClick:)];
        button.layer.borderWidth = borderWidth;
        button.layer.borderColor = borderColor.CGColor;
        CGSize z = CGSizeMake([text boundingRectWithSize:CGSizeMake(1000000, 20) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:TitleSize]} context:nil].size.width + Spacing, Height);
        CGFloat width = z.width;
        CGFloat height = z.height;
        [button sizeToFit];
        if (previousWidth+width >= self.size.width) {
            heightInt +=1;
            previousWidth = 0;
        }
        button.frame = CGRectMake(previousWidth,(height+hMagin)*heightInt, width, height);
        previousWidth = button.origin.x+width+kMagin;
        if (button.origin.y+height >= self.tagScrollview.size.height)self.tagScrollview.contentSize = CGSizeMake(0, button.origin.y+height);
        [self.tagScrollview addSubview:button];
    
    }
    
}

- (UIScrollView *)tagScrollview{
    if (!_tagScrollview) {
        _tagScrollview = [[ UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.size.height)];
    }
    return _tagScrollview;
}

@end
