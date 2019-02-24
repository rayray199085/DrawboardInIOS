//
//  SCDrawView.h
//  Drawboard
//
//  Created by Stephen Cao on 24/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCBezierPath.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCDrawView : UIView
@property(nonatomic,strong)UIColor *pathColor;
@property(nonatomic,assign)CGFloat pathWidth;
@property(nonatomic,strong)NSMutableArray *pathGroup;
@end

NS_ASSUME_NONNULL_END
