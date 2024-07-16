//
//  SkillsView.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 29/05/2024.
//

import Foundation
import SwiftUI

struct SkillsView: View {
    let skills: [Skill]
    
    var body: some View {
        List(skills, id: \.id) { skill in
            VStack(alignment: .leading, spacing: 5) {
                        Text(skill.name)
                            .font(.headline)
                            .foregroundColor(.black)
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 300, height: 20)
                                .foregroundColor(Color.gray.opacity(0.3))
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: CGFloat((skill.level + 0.001) / 10) * 300, height: 20)
                                .foregroundColor(Color.indigo.opacity(0.7))
                            Text(String(format: "%.2f%%", skill.level))
                                .fontWeight(.bold)
                                .frame(width: 300, height: 20)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
}

struct SkillsView_Previews: PreviewProvider {
    static var previews: some View {
        SkillsView(skills: [defaultSkills])
    }
}
