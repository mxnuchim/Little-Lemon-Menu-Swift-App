//
//  RegistrationScreen.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 01/02/2023.
//

import SwiftUI

struct RegistrationScreen: View {
    @AppStorage(AppConstants.kShowOnboarding) var showOnboardingScreen: Bool = true
    @AppStorage(AppConstants.kIsLoggedIn) var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: HomeScreen()
                        .navigationBarBackButtonHidden(true),
                    isActive: $isLoggedIn
                ) { EmptyView() }
                
                ScrollView {
                    VStack {
                        Image("Logo")
                            .padding(.vertical, 8)
                        HeroView()
                        UserDetailsForm(type: .register)
                            .padding()
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showOnboardingScreen) {
            OnboardingScreen()
        }
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen()
    }
}
