//
//  EasyFundsApp.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/8.
//

import SwiftUI


@main
struct EasyFundsApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newScenePhase in
            if newScenePhase == .active {
                Global.requestAdvertisingIdentifier()
            }
        }
    }
}
