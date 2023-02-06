//
//  ProfileScreen.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 05/02/2023.
//

import SwiftUI

struct ProfileScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ProfileCardView()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.primaryColor)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .onTapGesture {
                        dismiss()
                    }
                ,
                trailing: Image("Profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            )
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
