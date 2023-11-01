//
//  LoginView.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/30.
//

import SwiftUI
import SwiftUIX

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var contentViewModel : ContentViewModel
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView(showsIndicators: false) {
                Spacer().frame(height: 310)
                if viewModel.loginStep == 1  { PhoneInputView(viewModel: viewModel) }
                if viewModel.loginStep == 2 { OTPCodeInputView(viewModel: viewModel) }
            }
            .background(content: {
                ZStack(alignment: .top) {
                    Color(hex: "#429662")
                    Image("login_top_img")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                }
                .ignoresSafeArea()
            })
            .navigationBarItems(leading: BackButton(backAction: {
                if viewModel.loginStep == 1 {
                    presentationMode.dismiss()
                }
                
                if viewModel.loginStep == 2 {
                    viewModel.loginStep = 1
                }
            }))
            .navigationBarTransparent(true)
        }
        
    }
    
}

#Preview {
    LoginView()
}
