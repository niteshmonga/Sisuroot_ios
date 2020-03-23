
#import "MyWebserviceManager.h"
#import "AFHTTPRequestOperationManager.h"


@implementation MyWebserviceManager

-(void)callMyWebServiceManager:(NSString *)methodeName :(NSDictionary *) methodeDict:(NSDictionary *) parameterDict
{
  // NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/%@.php",methodeName];
    
     NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/%@.php",methodeName];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     manager.responseSerializer = [AFJSONResponseSerializer
     serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [manager POST:mainUrl parameters:parameterDict success:^(AFHTTPRequestOperation *operation,id responseObject)
     {
         NSLog(@"Test is.....%@",responseObject);
         [self.delegateMethode processCompleted: methodeName : methodeDict: responseObject];
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
          NSLog(@"%@",error);
         [self.delegateMethode processFailed: error];
     }];
}


-(void)callMyWebServiceManagerByGet:(NSString *)methodeName :(NSDictionary *) methodeDict:(NSDictionary *) parameterDict
{
    NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/%@.php",methodeName];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
      manager.responseSerializer = [AFJSONResponseSerializer
                                  serializerWithReadingOptions:NSJSONReadingAllowFragments];
 
    [manager GET:mainUrl parameters:parameterDict success:^(AFHTTPRequestOperation *operation,id responseObject)
     {
         NSLog(@"Test is.....%@",responseObject);
         [self.delegateMethode processCompleted: methodeName : methodeDict: responseObject];
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
        
         [self.delegateMethode processFailed: error];
     }];
}


-(void)callMyWebServiceManagerWithOutParameter:(NSString *)methodeName :(NSDictionary *) parameterDict
{
    NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/%@.php",methodeName];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer
                                  serializerWithReadingOptions:NSJSONReadingAllowFragments];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html; charset=UTF-8"];
    
    [manager POST:mainUrl parameters:nil success:^(AFHTTPRequestOperation *operation,id responseObject)
     {
         NSLog(@"Test is.....%@",responseObject);
         [self.delegateMethode processCompleted: methodeName : parameterDict : responseObject];
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         [self.delegateMethode processFailed: error];
     }];
}

@end

