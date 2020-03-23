//
//  MyWebServiceManagerProtocol.h
//  HereCut
//
//  Created by Asia Webnet MAC 2 on 02/12/15.
//  Copyright © 2015 Gautam Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyWebServiceManagerProtocol <NSObject>

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary;
-(void) processFailed :(NSError *)errorDictionary;
-(void) backCountryList : (NSString *)name : (NSString *) nameId : (NSString *)typeS : (NSIndexPath *)indexx;

-(void) backCountryList : (NSString *)countryId : (NSString *) countryName : (NSString *)cityId : (NSString *) cityName : (NSString *)typeS : (NSIndexPath *)indexx;

@end
