//
//  DataModel.swift
//  Lesson4-25
//
//  Created by Данил Марков on 03.02.2025.
//

import Foundation

struct UserInfo {
    let title: String
    let value: String
}

struct FamilyMember {
    let role: String
    let name: String
    let birthDate: String
}

let userInfoData: [UserInfo] = [
    UserInfo(title: "Sex", value: "Man"),
    UserInfo(title: "Work", value: "iOS Developer"),
    UserInfo(title: "University", value: "HSE")
]

let familyMembersData: [FamilyMember] = [
    FamilyMember(role: "Wife", name: "Carla", birthDate: "01.04.1981"),
    FamilyMember(role: "Child", name: "Maksim", birthDate: "25.12.2003"),
    FamilyMember(role: "Child", name: "Sveta", birthDate: "13.03.2004"),
    FamilyMember(role: "Father", name: "Patrik", birthDate: "12.12.1930"),
    FamilyMember(role: "Mother", name: "Patricia", birthDate: "30.01.1945")
]
