//
//  ProfileCardView.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 05/02/2023.
//

import SwiftUI

struct ProfileCardView: View {
    
    @AppStorage(AppConstants.kIsLoggedIn) var isLoggedIn: Bool = false
    
    var body: some View {
        ScrollView {
                VStack (alignment: .leading) {
                    Text("Personal information")
                        .font(Font.body)
                        .fontWeight(.bold)
                        .padding(.bottom, 16)
                    
                    HStack (alignment: .center, spacing: 20) {
                        VStack (alignment: .leading) {
                            Text("Avatar")
                                .foregroundColor(.gray)
                                .font(Font.body(size: 12))
                                .fontWeight(.bold)
                            
                            Image("Profile")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                        }
                        
                        Button(action: {
                            print("Change")
                        }, label: {
                            Text("Change")
                                .foregroundColor(.white)
                                .font(.body(size: 13))
                                .fontWeight(.bold)
                        })
                        .padding()
                        .background(Color.primaryColor)
                        .cornerRadius(16)
                        .padding(.top, 12)
                        
                        Button(action: {
                            print("Remove")
                        }, label: {
                            Text("Remove")
                                .foregroundColor(.gray)
                                .font(.body(size: 13))
                                .fontWeight(.bold)
                        })
                        .padding(15)
                        .border(Color.primaryColor, width: 1)
                        .padding(.top, 12)
                    }
                    
                    UserDetailsForm(type: .view)
            }
        }
        .padding()
        .frame(
            maxWidth: .infinity,
            alignment: .topLeading
        )
        .border(Color.highlightColor, width: 1)
        .cornerRadius(16)
        .padding(8)
    }
}

struct ProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardView()
    }
}
