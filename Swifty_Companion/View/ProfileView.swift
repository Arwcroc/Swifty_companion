//
//  ProfileView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 24/05/2024.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var level: Double = 11.54
    @State private var selectedSegment = 0
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: SearchView()) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.blue)
                            .padding(.leading, 5)
                        Text("Search")
                            .padding(.leading, -5)
                    }
                    HStack {
                        Spacer()
                        Text("Téo")
                        Text("Froissart")
                        Spacer()
                        Spacer()
                    }
                }
                ZStack(alignment: .center) {
                    Image(.orderBackground)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 410, height: 260)
                    HStack {
                        Image(.logoSCLow)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .padding(.horizontal)
                            .padding(.leading, -20)
                        VStack (alignment: .leading) {
                            Text("tefroiss")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                            Text("Grade")
                                .foregroundColor(.white)
                            Text("06XXXXXXXX")
                                .foregroundColor(.white)
                            Text("jesuisunmail@mail.com")
                            Text("E1 R10 P4")
                                .foregroundColor(.white)
                        }
                    }
                }
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 40)
                        .foregroundColor(Color.gray.opacity(0.3))
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: CGFloat(level.truncatingRemainder(dividingBy: 1)) * 300,height: 40)
                        .foregroundColor(Color.orange)
                    Text(String(format: "%.2f", level))
                        .fontWeight(.bold)
                        .frame(width: 300, height: 20)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                VStack {
                    Picker("Options", selection: $selectedSegment) {
                        Text("Projects").tag(0)
                        Text("Skills").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    if selectedSegment == 0 {
                        ProjectsView()
                    } else {
                        SkillsView()
                    }
                }
                Spacer()
            }
        }
        .navigationBarTitle("Home", displayMode: .inline)
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
