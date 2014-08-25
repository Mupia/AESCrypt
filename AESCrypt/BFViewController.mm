//
//  BFViewController.m
//  Test1
//
//

#import "BFViewController.h"
#include "AES.h"
#include <string>


@interface BFViewController ()

@end

@implementation BFViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}



NSString * const kAESEncrptKey = @"d4a3Ef14B6b5194r";

+ (NSString *)encrptStr:(NSDictionary *)params
{
    NSMutableString * encrprStr = [[NSMutableString alloc] init];
    
    for(NSString * key in params){
        NSString * value = [params valueForKey:key];
        NSData * data = [value dataUsingEncoding:NSUTF8StringEncoding];
        NSString * base64Value = [NSString base64StringFromData:data length:[data length]];
        NSLog(@"key: %@ value: %@",key,base64Value);
        [encrprStr appendFormat:@"&%@=%@",key,value];
     }

    [encrprStr deleteCharactersInRange:NSMakeRange(0, 1)];
    const char * inputStr = [encrprStr UTF8String];
    char  outputChar[1024];
    unsigned char *key  = (unsigned char *)[kAESEncrptKey UTF8String];
    CBm53AES_L aes(key);
    aes.CipherStr(inputStr, outputChar);
    
    NSString * mmStr =[[NSString alloc] initWithCString:outputChar encoding:NSUTF8StringEncoding];

    return mmStr;
}




+ (NSString *)decrptStr:(NSString *)inputStr
{
    unsigned char *key  = (unsigned char *)[kAESEncrptKey UTF8String];
    CBm53AES_L aes(key);
    char * inputChar = (char *)[inputStr UTF8String];
    char outChar[1024];
    aes.InvCipherStr(inputChar,outChar);
    
    NSString* deStr =[[NSString alloc] initWithCString:outChar encoding:NSUTF8StringEncoding];
    
    return deStr;
}


- (IBAction) testBtnClicked:(id)sender {
}

@end
