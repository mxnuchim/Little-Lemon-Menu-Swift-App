//
//  HomeScreen.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 06/02/2023.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        TabView {
            MenuScreen()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            ProfileScreen()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
            }
        }
        .navigationBarItems(trailing:Image("Profile")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30))
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
