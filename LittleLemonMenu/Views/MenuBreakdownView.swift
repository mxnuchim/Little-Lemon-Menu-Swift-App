//
//  MenuBreakdownView.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 05/02/2023.
//

import SwiftUI

struct MenuBreakdownView: View {
    
    @State var selectedMenuCategoryItem = ""
    
    let onMenuCategorySelected: (_ item: String) -> Void
    let menuCategories = [
        "Starters",
        "Mains",
        "Desserts",
        "Drinks"
    ]
    
    private func onSelectCategory(category: String) {
        if selectedMenuCategoryItem == category {
            selectedMenuCategoryItem = ""
        } else {
            selectedMenuCategoryItem = category
        }
        onMenuCategorySelected(category)
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Order for delivery!")
                .font(.body)
                .fontWeight(.bold)
                .textCase(.uppercase)
                .padding(.horizontal, 20)
            ScrollView (.horizontal, showsIndicators: false) {
                HStack (spacing: 20) {
                    ForEach(menuCategories, id: \.self) { category in
                        Text(category)
                            .foregroundColor(.primaryColor)
                            .font(.body)
                            .fontWeight(.bold)
                            .padding()
                            .background(selectedMenuCategoryItem == category ? Color.secondaryColor : Color.highlightColor)
                            .cornerRadius(16)
                            .onTapGesture { onSelectCategory(category: category)}
                    }
                }
            }
            .padding(.horizontal, 20)
            Divider()
                .padding(.top, 20)
        }
        .padding(.top, 10)
    }
}

struct MenuBreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBreakdownView(onMenuCategorySelected: { _ in })
    }
}
