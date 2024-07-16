//
//  ProfileView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 24/05/2024.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ViewModel
    
    init (user : User) {
        _viewModel = StateObject(wrappedValue: ViewModel(user))
    }
    
    var body: some View {
            VStack {
                ZStack(alignment: .center) {
                    Image(.formepastel)
                        .resizable()
                        .frame(width: 410, height: 180)
                    HStack {
                        AsyncImage(
                            url: URL(string: viewModel.user.image.link)
                                ) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                        VStack (alignment: .leading) {
                            Text(viewModel.user.usualFullName)
                                .foregroundColor(.black)
                                .font(.title)
                            Text(viewModel.user.login)
                                .foregroundColor(.black)
                            Text(viewModel.selectedCursus?.grade ?? "Student")
                                .foregroundColor(.black)
                            Text(viewModel.user.email)
                                .foregroundColor(.black)
                            Text(viewModel.user.location ?? "Offline")
                                .foregroundColor(.black)
                        }
                    }
                }
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 30)
                        .foregroundColor(Color.gray.opacity(0.3))
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: CGFloat((viewModel.selectedCursus?.level ?? 0.0).truncatingRemainder(dividingBy: 1)) * 300,height: 30)
                        .foregroundColor(Color.indigo.opacity(0.7))
                    Text(String(format: "%.2f", viewModel.selectedCursus?.level ?? 0.0))
                        .fontWeight(.bold)
                        .frame(width: 300, height: 20)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                VStack {
                    Picker("Cursus", selection: $viewModel.selectedCursusId) {
                        ForEach(viewModel.user.cursusUsers, id:\.cursusID) { cursus in
                            Text(cursus.cursus.name)
                        }
                    }
                    .onChange(of: viewModel.selectedCursusId) { oldState, newState in
                        viewModel.handleSelectCursus(newState)
                    }
                    Picker("Options", selection: $viewModel.selectedSegment) {
                        Text("Projects").tag(0)
                        Text("Skills").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    if viewModel.selectedSegment == 0 {
                        ProjectsView(projects : viewModel.getSelectedProjects())
                    } else if viewModel.selectedCursus?.skills != nil {
                        SkillsView(skills : viewModel.selectedCursus!.skills)
                    }
                }
            }
        }
}

extension ProfileView {
    class ViewModel: ObservableObject {
        let user: User
        @Published var selectedCursusId: Int
        @Published var selectedCursus: CursusUser?
        @Published var project: ProjectUser? = defaultProject
        @Published var selectedSegment = 0
        
        init(_ user: User) {
            self.user = user
            self.project = user.projectsUsers.first
            
            self.selectedCursusId = self.user.cursusUsers.first(where: { $0.cursus.slug == "42cursus" })?.cursusID ?? 0
            if self.selectedCursusId == 0 {
                print("did not find")
                self.selectedCursusId = self.user.cursusUsers.first?.cursusID ?? 0
            }
            getSelectedCursus()
        }
        
        func handleSelectCursus(_ cursusId : Int) {
            self.selectedCursusId = cursusId
            self.getSelectedCursus()
        }
        
        func getSelectedCursus() {
            self.selectedCursus = self.user.cursusUsers.first(where: {$0.cursusID == self.selectedCursusId})
        }
        
        func getSelectedProjects() -> [ProjectUser] {
            return self.user.projectsUsers.filter { project in
                return project.cursusIds.contains(selectedCursusId)
            }
            
        }
    }
}

#Preview {
    ProfileView(user: defaultUser)
}

