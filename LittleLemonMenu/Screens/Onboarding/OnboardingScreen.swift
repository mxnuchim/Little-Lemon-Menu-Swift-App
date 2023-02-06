//
//  OnboardingScreen.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 01/02/2023.
//

import SwiftUI

struct OnboardingScreen: View {
    @Environment(\.dismiss) var dismiss
    
    @State var activePageTag = 1
    
    let pages = [
        PageViewItem(
            title: "Welcome to Little Lemon",
            description: "We are pleased to serve you!",
            imageName: "welcome"),
        
        PageViewItem(
            title: "Choose your meals",
            description: "Get access to our menu and prices.",
            imageName: "select meal"),
        
        PageViewItem(
            title: "Book your table",
            description: "Have your table ready without any waiting time!",
            imageName: "eat together")
    ]
    
    private func nextPage() {
        if(activePageTag < pages.count) {
            activePageTag += 1
        } else {
            setOnboardingPageViewed()
        }
    }
    
    private func setOnboardingPageViewed() {
        UserDefaults.standard.set(false, forKey: "KShowOnboarding")
        dismiss()
    }
    
    var body: some View {
        VStack {
            TabView (selection: $activePageTag) {
                PageView(pageViewItem: pages[0])
                    .tag(1)
                PageView(pageViewItem: pages[1])
                    .tag(2)
                PageView(pageViewItem: pages[2])
                    .tag(3)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
                
            Button(action: {
                nextPage()
            }, label: {
                Text(activePageTag == pages.count ? "Get Started" : "Next")
                    .foregroundColor(.black)
                    .font(.body)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
            })
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.secondaryColor)
            .cornerRadius(16)
            .padding()
            
        }
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}
