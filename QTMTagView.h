//
//  QTMTagView.h
//  QianTuMei
//
//  Created by weiyuxiang on 2018/4/20.
//  Copyright © 2018年 luwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QTMTagViewDelegate <NSObject>

/**被点击的历史记录*/
- (void)searchText:(NSString *)text;

@end

@interface QTMTagView : UIView


@property (nonatomic, weak) id<QTMTagViewDelegate>delegate;

/**标签*/
- (void)joinTextArray:(NSArray *)array andTitleSize:(CGFloat)TitleSize andHeight:(CGFloat)Height andTitleColor:(UIColor *)TitleColor andborderWidth:(CGFloat)borderWidth andborderColor:(UIColor *)borderColor andSpacing:(CGFloat)Spacing andkMagin:(CGFloat)kMagin andhMagin:(CGFloat)hMagin;

@end
