//
//  MainTabView.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/25.
//

import SwiftUI

struct MainTabView: View {
    @State var tabSelectedIndex : Tab = .home
    @EnvironmentObject var contentViewModel : ContentViewModel
    
    enum Tab: Int { case home, feedback, privacy, profile }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $tabSelectedIndex, content:  {
            HomeView().environmentObject(contentViewModel).tag(Tab.home)
                .tabItem {
                    if tabSelectedIndex == Tab.home { Image("tab_home_selected") } else {
                        Image("tab_home_normal")
                    }
                    Text("Loan").foregroundColor(tabItemNormalColor)
                }
            
            FeedbackView().tag(Tab.feedback)
                .tabItem {
                    if tabSelectedIndex == Tab.feedback {
                        Image("tab_feedback_selected") } else { Image("tab_feedback_normal")
                        }
                    Text("Feedback").foregroundColor(tabItemNormalColor)
                }
            
            PrivacyView().tag(Tab.privacy)
                .tabItem {
                    if tabSelectedIndex == Tab.privacy {
                        Image("tab_privacy_selected") } else { Image("tab_privacy_normal")
                        }
                    Text("Privacy Policy").foregroundColor(tabItemNormalColor)
                }
            
            ProfileView().tag(Tab.profile)
                .tabItem {
                    if tabSelectedIndex == Tab.profile {
                        Image("tab_profile_selected") } else { Image("tab_profile_normal")
                        }
                    Text("Me").foregroundColor(tabItemNormalColor)
                }
        })
        .accentColor(tabItemSelectedColor)
        .background(.white)
        .onAppear{ Global.requestAdvertisingIdentifier() }
    }
    
    private let tabItemNormalColor = Color(hex: "#C2D0C8")
    private let tabItemSelectedColor = Color(hex: "#429662")
}

#Preview {
    MainTabView().environmentObject(ContentViewModel())
}
