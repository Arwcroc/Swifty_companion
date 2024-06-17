//
//  HomeView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 21/05/2024.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image(.logoSC)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 50)
                
                Button(action: { print("Login button tapped")}) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
            .environment(\.colorScheme, .light)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
