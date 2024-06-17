//
//  ContentView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 21/05/2024.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
				ZStack {
					Image(.intraBackground)
						.resizable()
						.aspectRatio(contentMode: .fill)
						.ignoresSafeArea(edges: .bottom)
					VStack {
						Image(.logoSC)
							.resizable()
							.scaledToFit()
							.frame(width: 200, height: 200)
						Text("Welcome aboard Captain")
							.font(.headline)
							.foregroundColor(.white)
							.padding(.bottom, 20)
						NavigationLink(destination: SearchView()) {
							Text("Go to Search")
								.font(.headline)
								.foregroundColor(.white)
								.padding()
								.background(Color.gray.opacity(0.2))
								.cornerRadius(10)
						}
					}
				}
            }
//            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
