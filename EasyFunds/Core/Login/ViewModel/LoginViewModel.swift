//
//  LoginViewModel.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/30.
//

import Foundation

class LoginViewModel : ObservableObject {
    @Published var phone : String = ""
    @Published var otpCode : String = ""
    @Published var loginStep: Int = 1
}
