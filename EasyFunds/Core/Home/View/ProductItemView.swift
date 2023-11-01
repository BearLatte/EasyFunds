//
//  ProductItemView.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/30.
//

import SwiftUI
import Kingfisher

struct ProductItemView: View {
    
    @State var product : Product
    @State var detailButtonOnPressed: () -> Void
    
    var body: some View {
        VStack {
            KFImage(URL(string: product.productLogo))
                .placeholder({
                    Global.placeholderView
                })
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(product.productName)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color(hex: "#333333"))
            
            HStack(spacing: 5) {
                Image("home_score_icon")
                    .frame(width: 36, height: 12)
                Text(String.randomScore())
                    .font(.system(size: 14))
                    .foregroundStyle(Color(hex: "#FF9102"))
            }
            
            Text("₹ \(product.productAmount ?? "0")")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(Color(hex: "#429662"))
                .padding(.top, 10)
            
            Text("Loan amount")
                .font(.system(size: 16))
                .foregroundStyle(Color(hex: "#999999"))
            
            Button(action: detailButtonOnPressed, label: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.black)
                    .frame(height: 30)
                    .padding(.top, 10)
                    .blur(radius: 4)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: "#429662"))
                            .frame(height: 30)
                            .padding(.top, 10)
                            .overlay {
                                Text("Detail")
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.top, 10)
                                    .foregroundStyle(.white)
                            }
                    }
            })
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
