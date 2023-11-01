//
//  ContentView.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import SwiftUI
import ToastUI

struct ContentView: View {
    @StateObject var viewModel : ContentViewModel = ContentViewModel()
    
    var body: some View {
        if viewModel.isFirstLaunch {
            IntroducationView().environmentObject(viewModel)
        } else {
            MainTabView().environmentObject(viewModel)
                .fullScreenCover(isPresented: $viewModel.isShowLoginView) {
                    LoginView().environmentObject(viewModel)
                }
        }
    }
}

#Preview {
    ContentView()
}
