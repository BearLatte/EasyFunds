//
//  HomeView.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/25.
//

import SwiftUI
import ToastUI
import Kingfisher

struct HomeView: View {
    @EnvironmentObject var contentViewModel : ContentViewModel
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color(hex: "#429662")
                .ignoresSafeArea()
            
            VStack {
                Image(contentViewModel.isVerified ? "home_verified_top_img" : "home_top_img")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Recommended for you")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.top, 180)
                    .padding(.leading, 20)
               
                ScrollView(.vertical) {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10, content: {
                        ForEach(viewModel.products) { product in
                            ProductItemView(product: product) {
                                if !Global.isLogin {
                                    contentViewModel.isShowLoginView = true
                                }
                            }
                        }
                    })
                    .padding(.horizontal, 20)
                }
            }
        }
        .toast(isPresented: $viewModel.isShowToast) {
            ToastView("Loading...").toastViewStyle(.indeterminate)
        }
        
    }
}

#Preview {
    HomeView().environmentObject(ContentViewModel())
}
