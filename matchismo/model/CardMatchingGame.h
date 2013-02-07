//
//  CardMatchingGame.h
//  matchismo
//
//  Created by Xavi Bolivar on 06/02/13.
//  Copyright (c) 2013 Xavi Bolívar. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Deck.h"


@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;
@property (strong,nonatomic,readonly) NSString *lastFlipResult;

@end
