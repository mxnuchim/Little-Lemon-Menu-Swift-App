//
//  PageView.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 01/02/2023.
//

import SwiftUI

struct PageView: View {
    let pageViewItem: PageViewItem
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(pageViewItem.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                
            Text(pageViewItem.title)
                .font(.headline)
                .padding()
            
            Text(pageViewItem.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity
        )
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        let testItem = PageViewItem(
            title: "Welcome to Little Lemon",
            description: "The place to be",
            imageName: "welcome")
        PageView(pageViewItem:testItem)
    }
}
