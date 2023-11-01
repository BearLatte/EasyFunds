//
//  HomeViewModel.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import Foundation
import ToastUI

class HomeViewModel : ObservableObject {
    @Published var isShowToast = false
    @Published var userInfo : UserInfo? {
        didSet {
            products = userInfo?.productList ?? []
        }
    }
    
    @Published var products : [Product] = [Product]()
    
    init() {
        Task { await fetchHomeViewData() }
    }
    
    @MainActor
    func fetchHomeViewData() async  {
        isShowToast = true
        userInfo = try? await APIService.fetchHomeData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.isShowToast = false
        }
    }
}
