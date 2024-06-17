//
//  SkillsView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 29/05/2024.
//

import Foundation
import SwiftUI

struct SkillsView: View {
    let skills = ["Skill 1", "Skill 2", "Skill 3", "Skill 4"]
    
    var body: some View {
        List(skills, id: \.self) { skill in
            Text(skill)
        }
    }
}

struct SkillsView_Previews: PreviewProvider {
    static var previews: some View {
        SkillsView()
    }
}
