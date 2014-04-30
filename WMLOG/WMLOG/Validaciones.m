//
//  Validaciones.m
//  WMLOG
//
//  Created by Francisco Santos on 29/04/14.
//  Copyright (c) 2014 CLICKSOFT. All rights reserved.
//

#import "Validaciones.h"

@implementation Validaciones
-(BOOL)isEmpty:(NSString *)text{
    if([text length]==0){
        return YES;
    }
    return NO;
}
-(BOOL)isNumberOk:(NSString *)puerto{
    NSScanner *scanner = [NSScanner scannerWithString:puerto];
    if([scanner scanInt:NULL]){
        return [scanner isAtEnd];
    }
    return NO;
}
-(BOOL)isEmailOk:(NSString *)text{
    NSString *regExpres = @"[A-Z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *email = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regExpres];
    return [email evaluateWithObject:text];
}
@end
