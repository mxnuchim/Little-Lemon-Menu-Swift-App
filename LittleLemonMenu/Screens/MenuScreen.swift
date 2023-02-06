//
//  MenuScreen.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 01/02/2023.
//

import SwiftUI
import CoreData

struct MenuScreen: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    @State var selectedCategory = ""
    @State var fetchingData = true
    @State var menuItems: [MenuItem] = []
    
    init() {
        UINavigationBar.appearance().backgroundColor = .white
    }
    
    private func onMenuItemCategorySelection(category: String) {
        if selectedCategory == category {
            selectedCategory = ""
        } else {
            selectedCategory = category
        }
    }
    
    //MARK: this function is important in order to not save duplicate data from the API call
    func exists(in context: NSManagedObjectContext, attributeValue: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dish")
        fetchRequest.predicate = NSPredicate(format: "title = %@", attributeValue)
        
        do {
            let results = try context.fetch(fetchRequest)
            return results.count > 0
        } catch {
            print("Error fetching objects")
            return false
        }
    }
    
    private func getMenuData() {
        let url = URL(string: AppConstants.serverUrl)!
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                    
            fetchingData = false
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let menuList = try decoder.decode(MenuList.self, from: data)
                    
                    menuList.menu.forEach { menuItem in
                        
                        if(!exists(in: viewContext, attributeValue: menuItem.title)){
                            print("add")
                            let dish = Dish(context: viewContext)
                            dish.title = menuItem.title
                            dish.price = menuItem.price
                            dish.image = menuItem.image
                            dish.category = menuItem.category
                            dish.dishDescription = menuItem.description
                        }
                    }
                    
                    try? viewContext.save()
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HeroView(searchEnabled: true) { searchText = $0 }
                MenuBreakdownView(onMenuCategorySelected: {
                    onMenuItemCategorySelection(category: $0.lowercased())
                })
                
                if fetchingData {
                    ProgressView()
                } else {
                    
                    FetchedObjects(
                        predicate: buildPredicate(),
                        sortDescriptors: buildSortDescriptors()
                    ) { (dishes: [Dish]) in
                        List {
                            ForEach (dishes) { dish in
                                MenuItemView(dish: dish)
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                }
                    
                Spacer()
            }
        }
        .onAppear {
            getMenuData()
        }
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
       return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }

    private func buildPredicate() -> NSPredicate {
        if !searchText.isEmpty && !selectedCategory.isEmpty{
           return NSPredicate(format:"(%K CONTAINS[cd] %@) AND (%K CONTAINS[cd] %@)",
                              "title", searchText,
                              "category", selectedCategory)
       } else if !selectedCategory.isEmpty && searchText.isEmpty {
           return NSPredicate(format: "category == %@", selectedCategory)
       }else if selectedCategory.isEmpty && !searchText.isEmpty {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
       } else if searchText.isEmpty {
            return NSPredicate(value: true)
       } else {
           return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
       }
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
