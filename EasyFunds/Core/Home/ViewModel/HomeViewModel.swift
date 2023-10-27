//
//  HomeViewModel.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import Foundation

class HomeViewModel : ObservableObject {
    
    @Published var userInfo : UserInfo? {
        didSet {
            products = userInfo?.productList ?? []
        }
    }
    
    @Published var products : [Product] = [Product]()
    
    init() {
        Task { await fetchHomeViewData() }
    }
    
    private func fetchHomeViewData() async  {
        
        userInfo = try? await APIService.fetchHomeData()
    }
}
