//
//  OTPCodeInputView.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/30.
//

import SwiftUI
import Combine

struct OTPCodeInputView: View {
    @StateObject var viewModel : LoginViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            LogoView()
            VStack(alignment: .leading) {
                HStack {
                    Image("phone_icon_white")
                        .padding(.horizontal, 16)
                    Text(viewModel.phone)
                        .font(.system(size: 18))
                        .foregroundStyle(.white)
                    Spacer()
                }
                
                Text("Enter code from SMS")
                    .font(.system(size: 18))
                    .foregroundStyle(.white)
                    .padding(.top, 34)
                    .padding(.leading, 16)
                
                
                ZStack {
                    LazyVGrid(columns: gridLayout, spacing: 9, content: {
                        ForEach(0 ..< 5, id: \.self) { index in
                            
                            TextField(text: $viewModel.otpCode, label: {
                                
                            })
                            
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .background(Color(hex: "#89B499"))
                            .cornerRadius(10, style: .circular)
                        }
                    })
                    .padding(.top, 10)
                    
//                    TextField("OTPCode", text: $otpCode)
                }
                
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Text("login now")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundStyle(Color("ThemeColor"))
                            .padding(.horizontal, 53)
                            .padding(.vertical, 12)
                            .background(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .shadow(x: 0, y: 2, blur: 4)
                            })
                    })
                    Spacer()
                }
                .padding(.top, 35)
            }
            .padding(.top, 100)
        }
        .padding(.horizontal, 30)
    }
    
    private let gridLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
}

#Preview {
    OTPCodeInputView(viewModel: LoginViewModel())
        .background(Color("ThemeColor"))
}
