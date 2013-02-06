//
//  PlayingCard.h
//  matchismo
//
//  Created by Xavi Bolívar on 05/02/13.
//  Copyright (c) 2013 Xavi Bolívar. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end
