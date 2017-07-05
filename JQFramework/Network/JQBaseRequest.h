//
//  JQBaseRequest.h
//
//  Created by 韩俊强 on 17/5/23.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <EGOCache/EGOCache.h>

typedef enum {//请求方式
    JQRequestMethodGET = 0,
    JQRequestMethodPOST,
    JQRequestMethodPUT,
    JQRequestMethodDELETE
} JQRequestMethod;

typedef enum {//缓存方式
    JQBaseRequestReturnCacheDataThenLoad = 0,  ///< 有缓存就先返回缓存，同步请求数据
    JQBaseRequestReloadIgnoringLocalCacheData, ///< 忽略缓存，重新请求
    JQBaseRequestReturnCacheDataElseLoad,      ///< 有缓存就用缓存，没有缓存就重新请求(用于数据不变时)
    JQBaseRequestReturnCacheDataDontLoad,      ///< 有缓存就用缓存，没有缓存就不发请求，当做请求出错处理（用于离线模式）
} JQBaseRequestRequestCachePolicy;

/**
 *  请求成功所走方法
 *
 *  @param responseObject 请求返还的数据
 */
typedef void (^JQResponseSuccess)(NSURLSessionDataTask * task,id responseObject);
/**
 *  请求错误所走方法
 *
 *  @param error 请求错误返还的信息
 */
typedef void (^JQResponseFail)(NSURLSessionDataTask * task, NSError * error);
/**
 *  进度条
 *
 *  param progress
 */
typedef void (^JQProgress)(NSProgress *progress);
/**
 *  上传文件成功回调
 *
 *  @param response response
 *  @param filePath filePath
 */
typedef void(^JQFileSuccess)(NSURLResponse * response,NSURL * filePath);

@interface JQBaseRequest : AFHTTPSessionManager

+ (JQBaseRequest *)sharedManager;//单例
/**
 *  网络状态
 */
-(void)netWorkReachability;

/**
 *  @method      请求网址
 */
- (JQBaseRequest* (^)(NSString * url))setRequest;

/**
 *  @method      请求类型，默认为GET
 */
- (JQBaseRequest* (^)(JQRequestMethod type))RequestType;

/**
 *  @brief 请求超时时间 默认20s
 */
- (JQBaseRequest* (^)(NSTimeInterval timeoutInterval))timeoutInterval;

/**
 *  @brief cer证书验证,不设置则不开启验证,默认不开启
 */
- (JQBaseRequest* (^)(NSString * cerName))cerName;

/**
 *  @brief 缓存类型,默认为JQBaseRequestReloadIgnoringLocalCacheData///< 忽略缓存，重新请求
 */
- (JQBaseRequest* (^)(JQBaseRequestRequestCachePolicy type))Cachetype;
/**
 *  @brief 缓存时间
 */
- (JQBaseRequest* (^)(NSTimeInterval timeoutInterval))CachTime;
/**
 *  @method      请求参数
 */
- (JQBaseRequest* (^)(id parameters))Parameters;
/**
 *  @method      请求头
 */
- (JQBaseRequest* (^)(NSDictionary * HTTPHeaderDic))HTTPHeader;

/*.......................下面是上传文件.................*/
/**
 *  上传的文件NSData
 */
- (JQBaseRequest* (^)(NSData * file_data))filedata;
/**
 *  上传的文件的参数名
 */
- (JQBaseRequest* (^)(NSString * name))name;
/**
 *  上传的文件的文件名（要有后缀名）
 */
- (JQBaseRequest* (^)(NSString * filename))filename;
/**
 *  上传的文件的文件类型
 */
- (JQBaseRequest* (^)(NSString * mimeType))mimeType;

//................................end.................//

/**
 *  发送请求
 *
 *  @param Success  成功的回调
 *  @param Progress 进度的回调
 *  @param Fail     请求错误的回调
 */
- (void)startRequestWithSuccess:(JQResponseSuccess)Success progress:(JQProgress)Progress failure:(JQResponseFail)Fail;
/**
 *  上传文件
 *
 *  @param Success  成功的回调
 *  @param Progress 进度的回调
 *  @param Fail     请求错误的
 */
-(void)uploadfileWithSuccess:(JQResponseSuccess)Success progress:(JQProgress)Progress failure:(JQResponseFail)Fail;
/**
 *  下载文件
 *
 *  @param Success  成功的回调
 *  @param Progress 进度的回调
 *  @param Fail     请求错误的
 *  @return 返回NSURLSessionDownloadTask实例，可用于暂停继续，暂停调用suspend方法，重新开启下载调用resume方法
 */
-(NSURLSessionDownloadTask *)downloadWithSuccess:(JQFileSuccess)Success progress:(JQProgress)Progress failure:(JQResponseFail)Fail;

/**
 *  取消所有网络请求
 */
- (void)cancelAllRequest;


@end
