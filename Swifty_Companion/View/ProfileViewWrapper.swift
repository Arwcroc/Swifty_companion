//
//  ProfileViewWrapper.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 09/07/2024.
//

import SwiftUI

struct ProfileViewWrapper: View {
    @StateObject var viewModel: ViewModel
    
    init(login : String) {
        _viewModel = StateObject(wrappedValue: ViewModel(login))
    }
    
    var body: some View {
        if viewModel.errorMessage != nil {
            Text(viewModel.errorMessage!)
                .foregroundColor(.red)
        }
        else if viewModel.user != nil {
            ProfileView(user: viewModel.user!)
        }
        else {
            ProgressView()
        }
    }
}

extension ProfileViewWrapper {
    class ViewModel: ObservableObject {
        @Published var user: User?
        @Published var errorMessage: String?
        
        init (_ login: String) {
            fetchUser(login)
        }
        
        func fetchUser(_ login: String) {
            OAuth.shared.fetchUser(login) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let user):
                        self.user = user
                        print("success")
                    case .failure(let error):
                        // TODO logout user on failure
                        self.errorMessage = "Failed to fetch user: \(error)"
                        print(error)
                    }
                }
            }
        }
    }
}


#Preview {
    ProfileViewWrapper(login: "tefroiss")
}
