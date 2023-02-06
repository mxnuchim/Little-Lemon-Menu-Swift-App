//
//  EmailNotificationsView.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 05/02/2023.
//

import SwiftUI

struct EmailNotificationsView: View {
    
    @AppStorage(AppConstants.KOrderStatusChecked) var orderStatusChecked: Bool = false
    @AppStorage(AppConstants.KPasswordChangesChecked) var passwordChangesChecked: Bool = false
    @AppStorage(AppConstants.KSpecialOffersChecked) var specialOffersChecked: Bool = false
    @AppStorage(AppConstants.KNewsLetterChecked) var newsLetterChecked: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Email notifications")
                .font(Font.body)
                .fontWeight(.bold)
            
            HStack {
                Image(systemName: orderStatusChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(orderStatusChecked ? Color.primaryColor : Color.secondary)
                    .onTapGesture {
                        orderStatusChecked.toggle()
                    }
                Text("Order Statuses")
                    .font(.body)
                    .foregroundColor(.primaryColor)
            }
            
            HStack {
                Image(systemName: passwordChangesChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(passwordChangesChecked ? Color.primaryColor : Color.secondary)
                    .onTapGesture {
                        passwordChangesChecked.toggle()
                    }
                Text("Password Changes")
                    .font(.body)
                    .foregroundColor(.primaryColor)
            }
            
            HStack {
                Image(systemName: specialOffersChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(specialOffersChecked ? Color.primaryColor : Color.secondary)
                    .onTapGesture {
                        specialOffersChecked.toggle()
                    }
                Text("Special offers")
                    .font(.body)
                    .foregroundColor(.primaryColor)
            }
            
            HStack {
                Image(systemName: newsLetterChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(newsLetterChecked ? Color.primaryColor : Color.secondary)
                    .onTapGesture {
                        newsLetterChecked.toggle()
                    }
                Text("Newsletter")
                    .font(.body)
                    .foregroundColor(.primaryColor)
            }
        }
    }
}

struct EmailNotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        EmailNotificationsView()
    }
}
