//
//  MyWebserviceManager.h
//  HereCut
//
//  Created by Asia Webnet MAC 2 on 02/12/15.
//  Copyright © 2015 Gautam Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "MyWebServiceManagerProtocol.h"


@interface MyWebserviceManager : NSObject

@property(nonatomic,strong)id<MyWebServiceManagerProtocol> delegateMethode;
-(void)callMyWebServiceManager:(NSString *)methodeName :(NSDictionary *) methodeDict :(NSDictionary *) parameterDict;
-(void)callMyWebServiceManagerWithOutParameter:(NSString *)methodeName :(NSDictionary *) methodeDict;
-(void)callMyWebServiceManagerForFlight :(NSString *)methodeName :(NSDictionary *) methodeDict;
-(void)callMyWebServiceManagerByGet:(NSString *)methodeName :(NSDictionary *) methodeDict:(NSDictionary *) parameterDict;

@end
