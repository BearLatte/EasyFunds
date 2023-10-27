//
//  ContentViewModel.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import Foundation

class ContentViewModel : ObservableObject {
    @Published var isFirstLaunch : Bool = UserDefaults.isFirstLaunchOfNewVersion
    @Published var isVerified : Bool = false
    
    init()  {
        Task { await APIService.firstRequest() }
    }
}
