//
//  SearchView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 21/05/2024.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var results: [User] = []
    
    var body: some View {
        VStack {
            // Search bar
            TextField("Search", text: $searchText, onCommit: performSearch)
                .onChange(of: searchText) { _, newValue in performSearch() }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if results.isEmpty {
                // Display logo and version when there are no results
                Spacer()
                VStack {
                    Image(.logoSC)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    Text("Swifty Companion - Version 1.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        
                }
                Spacer()
            } else {
                // Display search results in a grid
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                        ForEach(results) { user in
                            VStack {
                                Image(systemName: "person.crop.square")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                Text(user.name)
                                    .font(.caption)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .padding()
    }
    
    private func performSearch() {
        let allUsers: [User] = [
            User(id: UUID(), name: "Milf Oeil"),
            User(id: UUID(), name: "Dam Ien"),
            User(id: UUID(), name: "Teuf Roisse"),
            User(id: UUID(), name: "OQue Tavio")
        ]
        if searchText.isEmpty {
            results = []
        } else {
            results = allUsers.filter { user in
                user.name.range(of: searchText, options: .caseInsensitive) != nil
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
