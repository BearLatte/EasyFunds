//
//  Global.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import Foundation
import AdSupport
import AppTrackingTransparency
import SwiftUI

struct Global {
    // 颜色值
    
    // 常量
    static var isIpad = UIDevice.current.model == "iPad"
    static var isBangs : Bool {
        if UIDevice.current.model == "iPad" {
            return false
        }
        
        if #available(iOS 11.0, *) {
            guard let window = UIApplication.shared.delegate?.window,
                  let unwrapedWindow = window else {
                      return false
                  }
            if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
                return true
            }
        }
        return false
    }
    static var statusBarHeight: CGFloat    = isBangs ? 44.0 : 20.0
    static var navigationBarHeight: CGFloat = statusBarHeight + 44.0
    static var tabBarHeight: CGFloat = statusBarHeight == 20 ? 49.0 : 83.0
    static var topSafeArea  = (statusBarHeight - 20.0)
    static var bottomSafeArea = tabBarHeight - 49.0
    static var screenBounds = UIScreen.main.bounds
    static var screenWidth: CGFloat = UIScreen.main.bounds.width
    static var screenHeight: CGFloat = UIScreen.main.bounds.height
    static var screenScale = UIScreen.main.scale
    
    
    static let tokenExpiresNotificationName = Notification.Name("AccessTokenExpiresNotification")
    
    static var accessToken: String? { UserDefaults.standard.string(forKey: TOKEN_KEY) }
    static var idfa: String? { UserDefaults.standard.string(forKey: IDFA_KEY) }
    static var isLogin : Bool { UserDefaults.standard.bool(forKey: LOGIN_KEY) }
    
    static let placeholderView = Image("img_placeholder")
    
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
