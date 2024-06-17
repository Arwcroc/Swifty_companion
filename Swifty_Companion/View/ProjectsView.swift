//
//  ProjectsView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 29/05/2024.
//

import Foundation
import SwiftUI

struct ProjectsView: View {
    let projects = ["Project 1", "Project 2", "Project 3", "Project 4", "Project 4", "Project 4", "Project 4", "Project 4", "Project 4"]
    
    var body: some View {
        List(projects, id: \.self) { project in
            Text(project)
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
