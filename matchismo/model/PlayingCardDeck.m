//
//  PlayingCardDeck.m
//  matchismo
//
//  Created by Xavi Bolivar on 05/02/13.
//  Copyright (c) 2013 Xavi Bolívar. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id)init
{
    self = [super init];
    
    if (self){
        for (NSString *suit in [PlayingCard validSuits ]) {
            for (NSUInteger rank=1;rank <= [PlayingCard maxRank];rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card atTop:YES];
            }
        }
    }
    
    return self;
}

@end
