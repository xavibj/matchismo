//
//  CardMatchingGame.m
//  matchismo
//
//  Created by Xavi Bolivar on 06/02/13.
//  Copyright (c) 2013 Xavi Bolívar. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (strong, nonatomic) NSMutableArray *cards; //Array de Cartes
@property (nonatomic,readwrite) int score;
@property (strong,nonatomic,readwrite) NSString *lastFlipResult;

@end

@implementation CardMatchingGame

- (NSString *)lastFlipResult{
    if (!_lastFlipResult) _lastFlipResult = [[NSString alloc] init];
    
    return _lastFlipResult;
}

- (NSMutableArray *)cards{
    if (!_cards) _cards = [[NSMutableArray alloc] init]; //Lazy instantiation
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self){
        for (int i=0;i < count;i++){
            Card *card = [deck drawRandomCard];
            if (!card){
                self = nil;
            } else {
                self.cards[i] = card;
            }
            
        }
    }
    
    return self;
}



- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            for (Card *otherCard in self.cards){
                if (otherCard.faceUp && !otherCard.isUnplayable){
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore){
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score +=matchScore * MATCH_BONUS;
                        self.lastFlipResult = [NSString stringWithFormat:@"Matched %@ and %@ for 4 points.", card.contents, otherCard.contents];
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.lastFlipResult = [NSString stringWithFormat:@"%@ and %@ don't match! 2 point penalty.", card.contents, otherCard.contents];
                    }
                    break;
               }
            }
            self.score -= FLIP_COST;
         //   self.lastFlipResult = [NSString stringWithFormat:@"FLIP"];
        }
        card.faceUp = !card.isFaceUp;
    }
}
@end
