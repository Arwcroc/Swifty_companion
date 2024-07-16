//
//  ProjectsView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 29/05/2024.
//

import Foundation
import SwiftUI

struct ProjectsView: View {
    let projects: [ProjectUser]
    
    var body: some View {
        List(projects, id: \.project.id) { project in
            VStack (alignment: .leading){
                HStack {
                    Text(project.status == "in_progress" ? "🟠" : project.validated == true ? "🟢" : "🔴")
                        .padding()
                    Text(project.project.name)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Spacer()
                    if project.finalMark != nil {
                        Text("\(project.finalMark ?? 0)")
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    ProjectsView(projects : [defaultProject])
}
