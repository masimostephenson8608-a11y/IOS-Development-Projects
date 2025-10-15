//
//  PersonalityQuizApp.swift
//  PersonalityQuiz
//
//  Created by Masimo Stephenson on 10/13/25.
//

import SwiftUI

@main
struct PersonalityQuizApp: App {
    var manager = QuizManager()
    var body: some Scene {
        WindowGroup {
            TitleView()
        }.environment(manager)
    }
}
