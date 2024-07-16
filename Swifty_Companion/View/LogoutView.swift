//
//  LogoutView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 16/07/2024.
//

import SwiftUI

struct LogoutView: View {
    let onLogout: () -> Void
    @State private var presentAlert = false
    
    var body: some View {
        Button(
            action: { presentAlert = true },
            label: {
                Label("Logout", systemImage: "lock.fill")
                    .labelStyle(.titleAndIcon)
                    .fontWeight(.bold)
                    .frame(width: 150, height: 150)
                    .background(.red)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                    .foregroundColor(.white)
            }
        )
        .confirmationDialog(
            "Logging out",
            isPresented: $presentAlert
        ) {
            Button("Log out", role: .destructive) {
                onLogout()
            }
        } message: {
            Text("Are you sure you want to log out?")
        }
    }
}

#Preview {
    LogoutView(onLogout: {})
}
