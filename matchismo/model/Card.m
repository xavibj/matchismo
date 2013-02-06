//
//  Card.m
//  matchismo
//
//  Created by Xavi Bolívar on 05/02/13.
//  Copyright (c) 2013 Xavi Bolívar. All rights reserved.
//

#import "Card.h"

@implementation Card

-(NSInteger)match:(NSArray *)otherCards
{
    NSInteger score = 0;
    for (Card *card in otherCards)
    {
        if([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}


@end
