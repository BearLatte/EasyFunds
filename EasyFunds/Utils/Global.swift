//
//  Global.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import Foundation
import AdSupport
import AppTrackingTransparency

struct Global {
    
    static var accessToken: String? { UserDefaults.standard.string(forKey: TOKEN_KEY) }
    static var idfa: String? { UserDefaults.standard.string(forKey: IDFA_KEY) }
    static var isLogin : Bool { UserDefaults.standard.bool(forKey: LOGIN_KEY) }
    
    static func requestAdvertisingIdentifier() {
        if idfa != nil {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            ATTrackingManager.requestTrackingAuthorization { status in
                if status == .authorized {
                    UserDefaults.standard.setValue(ASIdentifierManager.shared().advertisingIdentifier.uuidString, forKey: IDFA_KEY)
                }
            }
        }
    }
    
    static func loginSuccessfulConfig(token: String) {
        UserDefaults.standard.setValue(token, forKey: TOKEN_KEY)
        UserDefaults.standard.setValue(true, forKey: LOGIN_KEY)
    }
    
    
    
    private static let IDFA_KEY  = "kADVERTISING_ID"
    private static let TOKEN_KEY = "kACCESS_TOKEN"
    private static let LOGIN_KEY = "kLOGIN"
}
