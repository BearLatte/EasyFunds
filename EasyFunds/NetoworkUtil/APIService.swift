//
//  APIService.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/27.
//

import Foundation

struct APIService {
    // 启动时的第一个网络请求
    static func firstRequest() async  {
        return await withCheckedContinuation { continuation in
            netProvider.request(.firstLaunch) { result in
                continuation.resume()
            }
        }
    }
    
    // 登录前首页
    static func fetchHomeData() async throws -> UserInfo? {
        let userInfo : UserInfo? = try await baseRequest(api: .unloginHome)
        return userInfo
    }
    
    static func baseRequest<T: Decodable>(api: API) async throws -> T? {
         
       try await withCheckedThrowingContinuation { continuation in
            netProvider.request(api) { result in
                switch result {
                case let .success(response):
                    
                    guard var res = try? response.mapJSON() as? [String : Any],
                          let status = res["rrcexosultCode"] as? Int,
                          let message = res["rrcexosultMsg"] as? String else {
                        return
                    }
                    res.removeValue(forKey: "rrcexosultCode")
                    res.removeValue(forKey: "rrcexosultMsg")
                    let newJson  = ["statusCode": status, "message" : message, "data" : res]
                    
                    guard let responseData =  try? JSONSerialization.data(withJSONObject: newJson, options: .prettyPrinted) else {
                        return
                    }
                    
                    do {
                        let baseResponse = try JSONDecoder().decode(BaseResponse<T>.self, from: responseData)
                        if baseResponse.statusCode == -1 {
                            NotificationCenter.default.post(name: Global.tokenExpiresNotificationName, object: nil)
                        }
                        if baseResponse.statusCode == 0 {
                            continuation.resume(throwing: APPError(baseResponse.message))
                        }
                        continuation.resume(returning: baseResponse.data)
                    } catch  {
                        continuation.resume(throwing: error)
                    }
                case let .failure(error):
                    debugLog("请求发生错误: \(error.localizedDescription)")
                }
            }
        }
    }
}


