//
//  AlbumSectionHeaderView.h
//  Delightful
//
//  Created by Nico Prananta on 11/21/13.
//  Copyright (c) 2013 Touches. All rights reserved.
//

#import "PhotosSectionHeaderView.h"

@interface AlbumSectionHeaderView : PhotosSectionHeaderView

@property (nonatomic, weak) CAShapeLayer *lineLayer;
@property (nonatomic, weak) CAShapeLayer *lineShadowLayer;

- (void)setText:(NSString *)text;

@end
