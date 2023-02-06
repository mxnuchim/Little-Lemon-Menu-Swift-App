//
//  MenuItemView.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 05/02/2023.
//
import UIKit
import SwiftUI

struct MenuItemView: View {
    let dish: Dish
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text(dish.title ?? "")
                .font(.body)
                .fontWeight(.bold)
            HStack {
                VStack (alignment: .leading, spacing: 10) {
                    Text(dish.dishDescription ?? "")
                        .font(.body)
                        .foregroundColor(.primaryColor)
                        .lineLimit(2)
                    if let price = dish.price {
                        Text("$\(String(format: "%.2f", Float(price)!))")
                            .font(.body)
                            .foregroundColor(.primaryColor)
                            .fontWeight(.semibold)
                    }
                }
                
                Spacer()
                
                AsyncImage( url: URL(string: dish.image ?? "" ), content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipped()
                        .padding(.leading, 10)
                },
                    placeholder: {
                    ProgressView()
                        .frame(width: 80, height: 80)
                    
                })
            }
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var viewContext = PersistenceController.shared.container.viewContext
    
    static var previews: some View {
        let sampleDish = Dish(context: viewContext)
        sampleDish.title = "Title"
        sampleDish.dishDescription = "Description"
        sampleDish.price = "12"
        sampleDish.image = "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=100&q=80"
        return MenuItemView(dish: sampleDish)
            .environment(\.managedObjectContext, viewContext)
    }
}
