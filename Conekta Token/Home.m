//
//  ViewController.m
//  Conekta Token
//
//  Created by Galileo Guzman on 28/11/15.
//  Copyright © 2015 Galileo Guzman. All rights reserved.
//

#import "Home.h"
#import "Conekta.h"

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) getToken
{
    Conekta *conekta = [[Conekta alloc] init];
    [conekta setDelegate: self];
    [conekta setPublicKey:@"your_public_key"];
    [conekta collectDevice];
    
    
    // create objecti type conekta
    Card *card = [conekta.Card initWithNumber: @"credit_card_number" name: @"owner_credit_card" cvc: @"000" expMonth: @"01" expYear: @"2020"];
    
    Token *token = [conekta.Token initWithCard:card];
    
    [token createWithSuccess: ^(NSDictionary *data) {
        NSLog(@"%@", data);
    } andError: ^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
