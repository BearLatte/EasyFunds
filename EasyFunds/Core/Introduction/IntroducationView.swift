//
//  IntroducationView.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/25.
//

import SwiftUI

struct IntroducationView: View {
    
    @EnvironmentObject var viewModel : ContentViewModel
    
    var body: some View {
        TabView {
            ForEach(introductions.indices, id: \.self) { index in
                ZStack {
                    Color.white
                    Image(introductions[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    
                    if index == introductions.count - 1 {
                        VStack {
                            Spacer()
                            Button(action: {
                                viewModel.isFirstLaunch = false
                            }, label: {
                                Text("")
                                    .frame(width: UIScreen.main.bounds.width, height: 80)
                            })
                        }
                    }
                }
                .ignoresSafeArea()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea()
    }
    
    private let introductions = ["introduction_01", "introduction_02", "introduction_03"]
}

#Preview {
    IntroducationView()
}
