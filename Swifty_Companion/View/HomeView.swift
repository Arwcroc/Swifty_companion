//
//  HomeView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 21/05/2024.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.errorMessage != nil {
            Text(viewModel.errorMessage ?? "Error")
                .foregroundColor(.red)
        } else if viewModel.isAuthenticated {
            ContentView(onLogout: viewModel.handleLogout)
        } else {
            NavigationView {
                NavigationLink(
                    destination: WebView(url: viewModel.authorizationUrl, onCustomLink: viewModel.handleCallback),
                    label: {
                        ZStack {
                            Color.white.edgesIgnoringSafeArea(.all)
                            VStack {
                                Spacer()
                                Image(.logoSC)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .padding(.bottom, 50)
                                Text("Login with OAuth")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 200, height: 50)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                Spacer()
                                Text("Swifty-Companion v-1.0")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                    })
            }
        }
    }
}

extension HomeView {
    @Observable
    class ViewModel {
        var isAuthenticated: Bool = false
        var authorizationUrl: URL?
        var errorMessage: String?
        
        init() {
            initSelf()
        }
        
        private func initSelf() {
            do {
                self.authorizationUrl = try OAuth.shared.authorizeUrl()
                self.isAuthenticated = OAuth.shared.isAuthenticated()
            } catch APIKeychain.KeychainError.noData {
                self.isAuthenticated = false
            } catch APIKeychain.KeychainError.unhandledError(let status, let context) {
                self.errorMessage = "Failed to interact with keychain storage: \(status) (\(context ?? "no context"))"
            } catch (let error) {
                self.errorMessage = "Failed to generate authorization URL: \(error)"
            }
        }
        
        func handleLogout() {
            try? OAuth.shared.logout()
            initSelf()
        }
        
        func handleCallback(url: URL) {
            do {
                try OAuth.shared.handleCallback(url: url)
                fetchAccessToken()
            } catch (let error) {
                self.errorMessage = "Failed to handle callback: \(error)"
            }
        }
        
        private func fetchAccessToken() {
            OAuth.shared.fetchAccessTokenCode() { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(_):
                        self.isAuthenticated = true
                    case .failure(let error):
                        self.errorMessage = "Failed to fetch access token: \(error)"
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
