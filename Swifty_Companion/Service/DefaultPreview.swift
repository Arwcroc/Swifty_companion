//
//  DefaultPreview.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 16/07/2024.
//

import Foundation

var defaultUser: User = User(
    id: 1000,
    login: "tefroiss",
    email: "jesuisunmail@mail",
    usualFullName: "Téo Froissart",
    image: UserImage(link:"https://thispersondoesnotexist.com/"),
    correctionPoint: 4,
    location: "nowhere",
    wallet: 20000,
    cursusUsers: [defaultCursus, defaultCursus2],
    projectsUsers: [defaultProject]
)

var defaultCursus: CursusUser = CursusUser(
    id: 21,
    grade: "Sith",
    level: 11.24,
    skills: [],
    cursusID: 22,
    hasCoalition: true,
    cursus: CursusDigest(
        id: 23,
        name: "42 Cursus",
        slug: "42cursus"
    )
)

var defaultCursus2: CursusUser = CursusUser(
    id: 42,
    grade: "Jedi",
    level: 61.64,
    skills: [],
    cursusID: 43,
    hasCoalition: true,
    cursus: CursusDigest(
        id: 44,
        name: "The Cursus",
        slug: "cursusss42"
    )
)

var defaultProject: ProjectUser = ProjectUser(
    id: 0,
    finalMark: 125,
    status: "finished",
    validated: true,
    project: ProjectDigest (
        id: 0,
        name: "Cube4d",
        slug: "42_cube4d"
    ),
    cursusIds: [0, 1, 43, 3],
    marked: true
)

var defaultSkills: Skill = Skill(
    id: 4,
        name: "Unix",
        level: 9.31
    )
