//
//  ContentView.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel : ContentViewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.isFirstLaunch {
                IntroducationView().environmentObject(viewModel)
            } else {
                MainTabView().environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
