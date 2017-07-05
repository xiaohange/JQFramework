//
//  JQBaseRequest.m
//
//  Created by 韩俊强 on 17/5/23.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import "JQBaseRequest.h"
#import "NSJSONSerialization+JQJSON.h"

@interface JQBaseRequest ()

@property (nonatomic, copy) NSString* url;
@property (nonatomic, assign) JQRequestMethod JQRequestType;
@property (nonatomic, assign) JQBaseRequestRequestCachePolicy JQRequestCache;
@property (nonatomic, assign) NSTimeInterval cachTimeoutInterval;
@property (nonatomic, strong) NSData* JQFile_data;
@property (nonatomic, copy) NSString* JQName;
@property (nonatomic, copy) NSString* JQFilename;
@property (nonatomic, copy) NSString* JQMimeType;
@property (nonatomic, copy) NSString* cerNamed;
@property (nonatomic, copy) id parameters;
@property (nonatomic, copy) NSDictionary* JQHTTPHeader;

@end
@implementation JQBaseRequest

+ (JQBaseRequest *)sharedManager {
    static JQBaseRequest *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[JQBaseRequest alloc] initWithBaseURL:[NSURL URLWithString:@""]]; // 不想设置可以在外层设置
    });
    return _sharedManager;
}
-(void)netWorkReachability {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                NSLog(@"未知信号");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                NSLog(@"手机信号");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                NSLog(@"wiFi信号");
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                NSLog(@"没有信号");
            }
                break;

            default:
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
}
- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    //返回类型默认JSON
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    //超时时间 默认20
    self.requestSerializer.timeoutInterval = 20;
    //返回格式
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json",@"text/html", nil];
    //请求格式
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    self.JQRequestType = JQRequestMethodGET;
    //缓存类型
    self.JQRequestCache = JQBaseRequestReloadIgnoringLocalCacheData;
    //缓存时间默认为 60*60
    self.cachTimeoutInterval = 60*60;
    
    return self;
}

- (JQBaseRequest *(^)(NSString *))setRequest {
    return ^JQBaseRequest* (NSString * url) {
        self.url = url;
        return self;
    };
}

- (JQBaseRequest *(^)(JQRequestMethod))RequestType {
    return ^JQBaseRequest* (JQRequestMethod type) {
        self.JQRequestType = type;

        return self;
    };
}

- (JQBaseRequest* (^)(NSTimeInterval))timeoutInterval {
    return ^JQBaseRequest* (NSTimeInterval timeoutInterval) {
        self.requestSerializer.timeoutInterval = timeoutInterval;
        
        return self;
    };
}
- (JQBaseRequest* (^)(NSString * cerName))cerName {
    return ^JQBaseRequest* (NSString * cerName) {
        self.cerNamed = cerName;
        
        return self;
    };
}
- (JQBaseRequest* (^)(JQBaseRequestRequestCachePolicy))Cachetype{
    return ^JQBaseRequest* (JQBaseRequestRequestCachePolicy type) {
        self.JQRequestCache = type;

        return self;
    };
}
- (JQBaseRequest* (^)(NSTimeInterval))CachTime {
    return ^JQBaseRequest* (NSTimeInterval timeoutInterval) {
        self.cachTimeoutInterval = timeoutInterval;

        return self;
    };
}

- (JQBaseRequest* (^)(id parameters))Parameters {
    return ^JQBaseRequest* (id parameters) {
        self.parameters = parameters;
        return self;
    };
}
- (JQBaseRequest *(^)(NSDictionary *))HTTPHeader {
    return ^JQBaseRequest* (NSDictionary * HTTPHeaderDic) {
        self.JQHTTPHeader = HTTPHeaderDic;
        return self;
    };
}
- (JQBaseRequest* (^)(NSData * file_data))filedata {
    return ^JQBaseRequest* (NSData * file_data) {
        self.JQFile_data = file_data;
        return self;
    };
}
- (JQBaseRequest* (^)(NSString * name))name {
    return ^JQBaseRequest* (NSString * name) {
        self.JQName = name;
        return self;
    };
}
- (JQBaseRequest* (^)(NSString * filename))filename {
    return ^JQBaseRequest* (NSString * filename) {
        self.JQFilename = filename;
        return self;
    };
}
- (JQBaseRequest* (^)(NSString * mimeType))mimeType {
    return ^JQBaseRequest* (NSString * mimeType) {
        self.JQMimeType = mimeType;
        return self;
    };
}

- (void)startRequestWithSuccess:(JQResponseSuccess)Success progress:(JQProgress)Progress failure:(JQResponseFail)Fail {
    JQBaseRequest * manager = [[self class]sharedManager]; [self judgeCer];
    //设置请求头
    [self setupHTTPHeaderWithManager:manager];

    NSString *cacheKey = self.url?self.url:@"";
    if (self.parameters) {
        if (![NSJSONSerialization isValidJSONObject:self.parameters]) return;//参数不是json类型
        NSData *data = [NSJSONSerialization dataWithJSONObject:self.parameters options:NSJSONWritingPrettyPrinted error:nil];
        NSString *paramStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        cacheKey = [cacheKey stringByAppendingString:paramStr];
    }
    //初始化缓存
    EGOCache *egocache = [EGOCache globalCache];
    //设置缓存时间 默认时间一天  一天的时间表示：24*60*60
    egocache.defaultTimeoutInterval = self.cachTimeoutInterval;
    //获取缓存
    id object = [egocache objectForKey:cacheKey];
    switch (self.JQRequestCache) {
        case JQBaseRequestReturnCacheDataThenLoad: {//先返回缓存，同时请求
            if (object) {
                Success(nil,object);
            }
            break;
        }
        case JQBaseRequestReloadIgnoringLocalCacheData: {//忽略本地缓存直接请求
            //不做处理，直接请求
            break;
        }
        case JQBaseRequestReturnCacheDataElseLoad: {//有缓存就返回缓存，没有就请求
            if (object) {//有缓存
                Success(nil,object);
                return ;
            }
            break;
        }
        case JQBaseRequestReturnCacheDataDontLoad: {//有缓存就返回缓存,从不请求（用于没有网络）
            if (object) {//有缓存
                Success(nil,object);
            }
            return ;//退出从不请求
        }
        default: {
            break;
        }
    }

    switch (self.JQRequestType) {
        case JQRequestMethodGET: {
            [manager GET:self.url parameters:self.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                Progress(downloadProgress);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject isKindOfClass:[NSData class]]) {
                    responseObject = [NSJSONSerialization objectWithJSONData:responseObject];
                }
                [egocache setObject:responseObject forKey:cacheKey];

                Success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                Fail(task,error);
            }];
        }
            break;

        case JQRequestMethodPOST: {
            [manager POST:self.url parameters:self.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                Progress(downloadProgress);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject isKindOfClass:[NSData class]]) {
                    responseObject = [NSJSONSerialization objectWithJSONData:responseObject];
                }
                [egocache setObject:responseObject forKey:cacheKey];
                Success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                Fail(task,error);
            }];
        }
            break;

        case JQRequestMethodPUT: {
            [manager PUT:self.url parameters:self.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject isKindOfClass:[NSData class]]) {
                    responseObject = [NSJSONSerialization objectWithJSONData:responseObject];
                }
                [egocache setObject:responseObject forKey:cacheKey];
                Success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                Fail(task,error);
            }];
        }
            break;

        case JQRequestMethodDELETE: {
            [manager DELETE:self.url parameters:self.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject isKindOfClass:[NSData class]]) {
                    responseObject = [NSJSONSerialization objectWithJSONData:responseObject];
                }
                [egocache setObject:responseObject forKey:cacheKey];
                Success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               Fail(task,error);
            }];
        }
            break;
        default:
            break;
    }
}

-(void)uploadfileWithSuccess:(JQResponseSuccess)Success progress:(JQProgress)Progress failure:(JQResponseFail)Fail {
    JQBaseRequest * manager = [[self class]sharedManager]; [self judgeCer];
    [manager POST:self.url parameters:self.parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:self.JQFile_data name:self.JQName fileName:self.JQFilename mimeType:self.JQMimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        Progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        Success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        Fail(task,error);
    }];
}

-(NSURLSessionDownloadTask *)downloadWithSuccess:(JQFileSuccess)Success progress:(JQProgress)Progress failure:(JQResponseFail)Fail {
    JQBaseRequest * manager = [[self class]sharedManager]; [self judgeCer];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    NSURLSessionDownloadTask *downloadtask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        Progress(downloadProgress);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //保存文件url (可自己改)
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        NSURL *fileUrl = [NSURL fileURLWithPath:cachesPath];

        return [fileUrl URLByAppendingPathComponent:[response suggestedFilename]];

    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (error) {
            Fail(nil,error);
        }
        else{
            Success(response,filePath);
        }
    }];
    [downloadtask resume];
    return  downloadtask;
}

- (JQBaseRequest *)setupHTTPHeaderWithManager:(JQBaseRequest *)manager {
    for (NSString * key in self.JQHTTPHeader.allKeys) {
        [manager.requestSerializer setValue:self.JQHTTPHeader[key] forHTTPHeaderField:key];
    }
    return manager;
}

- (void)cancelAllRequest {

    [self.operationQueue cancelAllOperations];
}

#pragma mark - https认证
- (void)judgeCer
{
    if (self.cerNamed) {
        self.securityPolicy.allowInvalidCertificates = YES;
        self.securityPolicy = [self customSecurityPolicy:self.cerNamed];
    }else{
        self.securityPolicy.allowInvalidCertificates = NO;
    }
}
- (AFSecurityPolicy*)customSecurityPolicy:(NSString *)cerName
{
    //先导入证书
    //证书的路径
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:cerName ofType:@"cer"];
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    //AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    //allowInvalidCertificates 是否允许无效证书(也就是自建的证书),默认为NO
    //如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    
    //如置为NO，建议自己添加对应域名的校验逻辑。
    //是否验证域名（一般不验证）
    securityPolicy.validatesDomainName = NO;
    NSSet * dataSet = [NSSet setWithObject:certData];
    securityPolicy.pinnedCertificates = dataSet;

    return securityPolicy;
}

@end
