//
//  PhoneInputView.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/30.
//

import SwiftUI

struct PhoneInputView: View {
    
    @StateObject var viewModel : LoginViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            LogoView()
            Text("Mobile number")
                .font(.system(size: 18))
                .foregroundStyle(.white)
                .padding(.leading, 20)
            
            HStack{
                TextField("Mobile number", text: $viewModel.phone)
                    
                Image("phone_icon")
            }
            .frame(height: 50)
            .padding(.horizontal, 20)
            .background(Color(hex: "#89B499"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                Spacer()
                Button(action: {
                    if !viewModel.phone.isBlank {
                        viewModel.loginStep = 2
                    }
                    
                }, label: {
                    Circle()
                        .fill(.white)
                        .frame(width: 86, height: 86)
                        .overlay {
                            Text("OTP")
                                .font(.system(size: 30, weight: .semibold))
                                .foregroundStyle(Color("ThemeColor"))
                                .frame(width: 76, height: 76)
                                .overlay {
                                    Circle().stroke(Color("ThemeColor"))
                                }
                        }
                })
                Spacer()
            }
            .padding(.top, 50)
        }
        .padding(.horizontal, 30)
        
    }
}

#Preview {
    PhoneInputView(viewModel: LoginViewModel())
}
