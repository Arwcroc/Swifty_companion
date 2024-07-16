//
//  SearchView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 21/05/2024.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: ViewModel
    
    init () {
        _viewModel = StateObject(wrappedValue: ViewModel())
    }
    
    var body: some View {
        NavigationStack {
            if viewModel.searchText == "" {
                ProfileViewWrapper(login: "me")
            }
            else if viewModel.searchText != viewModel.debouncedText {
                ProgressView()
            }
            else {
                ProfileViewWrapper(login : viewModel.debouncedText.lowercased())
            }
        }
        .searchable(text: $viewModel.searchText)
        .disableAutocorrection(true)
        .autocapitalization(.none)
    }
}

extension SearchView {
    class ViewModel: ObservableObject {
        @Published var searchText = ""
        @Published var debouncedText = ""
        
        init () {
            debouncedText = searchText
            $searchText
                .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
                .assign(to: &$debouncedText)
        }
    }
}

#Preview {
    SearchView()
}
