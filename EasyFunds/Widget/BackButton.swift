//
//  BackButton.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/30.
//

import SwiftUI

struct BackButton: View {
    var backAction : (() -> Void)?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            if backAction != nil {
                backAction!()
            } else {
                presentationMode.wrappedValue.dismiss()
            }
        }, label: {
            Image("back_icon")
                .scaledToFit()
                .frame(width: 44, height: 44)
        })
    }
}

#Preview {
    BackButton()
}
