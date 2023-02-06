//
//  HeroView.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 04/02/2023.
//

import SwiftUI

struct HeroView: View {
    
    let onSearchTextFieldChanged: (_ value: String) -> Void
    
    @State var searchEnabled = false
    @State var searchFieldExpanded = false
    @State var searchText = ""
    
    init( searchEnabled: Bool = false, onSearchTextFieldChanged: @escaping (_: String) -> Void = {_ in }) {
        self.searchEnabled = searchEnabled
        self.onSearchTextFieldChanged = onSearchTextFieldChanged
    }
    
    private func toggleSearchField() {
        withAnimation {
            searchFieldExpanded.toggle()
        }
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Little Lemon")
                    .font(.headline(size: 64))
                    .foregroundColor(.secondaryColor)

                HStack (alignment: .center){
                    VStack(alignment: .leading){
                        Text("Chicago")
                            .font(.headline(size: 56))
                            .foregroundColor(.white)
                            .padding(.bottom, 8)
                        
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    
                    Image("Hero image")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 132, height: 132)
                        .cornerRadius(16)
                        .padding(.leading, 10)
                }
                .padding(.top, -80)
                
                if searchEnabled {
                    if searchFieldExpanded {
                        HStack {
                            TextField("Search...", text: $searchText)
                                .textFieldStyle(.roundedBorder)
                                .onChange (of: searchText) {
                                    onSearchTextFieldChanged($0)
                                }
                            Image(systemName: "xmark")
                                .frame(width: 30, height: 30)
                                .background(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    searchText = ""
                                    toggleSearchField()
                                }
                        }
                    } else {
                        Image(systemName: "magnifyingglass")
                            .frame(width: 34, height: 34)
                            .background(.white)
                            .clipShape(Circle())
                            .onTapGesture {
                                toggleSearchField()
                            }
                    }
                }
            }
            .padding()
            .frame(
              minWidth: 0,
              maxWidth: .infinity,
              alignment: .topLeading
            )
            .background(Color.primaryColor)
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
