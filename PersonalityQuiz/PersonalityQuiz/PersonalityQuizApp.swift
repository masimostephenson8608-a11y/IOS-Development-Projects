//
//  PersonalityQuizApp.swift
//  PersonalityQuiz
//
//  Created by Masimo Stephenson on 10/13/25.
//

import SwiftUI

@main
struct PersonalityQuizApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                BackgroundView()
                RangedQuestionSubview(question: "Do you like the pool?")
                
            }
            .environment(QuizManager())
        }
    }
}
