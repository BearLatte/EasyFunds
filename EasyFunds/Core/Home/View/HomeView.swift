//
//  HomeView.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var contentViewModel : ContentViewModel
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color(hex: "#429662")
            VStack {
                Image(contentViewModel.isVerified ? "home_verified_top_img" : "home_top_img")
                    .resizable()
                    .scaledToFit()
                
            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    HomeView().environmentObject(ContentViewModel())
}
