//
//  BFViewController.h
//  AESCrypt

#import <UIKit/UIKit.h>

#import "NSString+Base64.h"

@interface  BFViewController: UIViewController

+ (NSString *)encrptStr:(NSDictionary *)params;
+ (NSString *)decrptStr:(NSString *)inputStr;


@end