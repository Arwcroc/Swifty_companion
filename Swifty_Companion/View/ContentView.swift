//
//  ContentView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 21/05/2024.
//

import Foundation
import SwiftUI

struct ContentView: View {
	let onLogout: () -> Void
	@State private var presentAlert = false
	
	var body: some View {
		BottomBar(tabs: [
			Tab(
				title: "Me",
				iconName: "person.crop.circle",
				content: AnyView(SearchView())
			),
			Tab(
				title: "Logout",
				iconName: "lock.fill",
				content: AnyView(LogoutView(onLogout: onLogout))
			)
		])
	}
}

#Preview {
	ContentView(onLogout: {})
}
