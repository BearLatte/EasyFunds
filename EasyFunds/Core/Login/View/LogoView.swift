//
//  LogoView.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/30.
//

import SwiftUI

struct LogoView: View {
    
    
    var body: some View {
        HStack(alignment: .top) {
            Text("Sign In")
                .font(.system(size: 44, weight: .semibold))
                .foregroundStyle(.white)
                .frame(height: 62)
                
            Spacer()
            Image("login_logo_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 125, height: 103)
                .padding(.top, 30)
        }
    }
}

#Preview {
    LogoView()
        
}
