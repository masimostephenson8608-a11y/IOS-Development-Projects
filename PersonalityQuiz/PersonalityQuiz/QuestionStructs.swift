//
//  QuestionStructs.swift
//  PersonalityQuiz
//
//  Created by Masimo Stephenson on 10/14/25.
//
import Observation

import Foundation

struct Question {
    var text: String
    var questionType: QuestionType
    var answers: [Answer]
}

enum QuestionType {
    case singleChoice, multipleChoice, rangedQuestion
}

struct Answer {
    var dessert: Dessert
    var text: String

    static var possibilities = [
        Answer(
            dessert: .IceCream,
            text:
                """
                The Classic Optimist
                You value comfort and consistency. You’re easy to be around and always find joy in the little things. Everyone feels calmer when you’re around.
                """
        ),
        Answer(
            dessert: .Brownie,
            text:
                """
                The Loyal Friend
                Warm, grounded, and dependable — you’re everyone’s favorite person to talk to. You bring comfort and stability to any situation.
                """
        ),
        Answer(
            dessert: .StrawberryMacaron,
            text:
                """
                The Social Butterfly
                You love excitement, connection, and trying new things. You’ve got an infectious energy that draws people in wherever you go.
                """
        ),
        Answer(
            dessert: .LemonTart,
            text:
                """
                            The Bold Dreamer
                            You live for creativity and adventure. Your confidence and zest for life make you unforgettable — and maybe a little unpredictable.
                """
        ),
    ]
}

enum Dessert: String {
    case IceCream = "Ice Cream"
    case Brownie = "Brownie"
    case StrawberryMacaron = "Strawberry Macaron"
    case LemonTart = "Lemon Tart"
}

@Observable
class QuizManager {
    var currentQuestion = 0
    var selectedAnswers: [Answer] = []
    let questionList: [Question] =  [
        Question(
            text: "It’s Saturday afternoon — what are you in the mood to do?",
            questionType: .singleChoice,
            answers: [
                Answer(dessert: .IceCream, text: "Curl up with a book and a blanket"),
                Answer(dessert: .Brownie, text: "Go out with friends and make memories"),
                Answer(dessert: .StrawberryMacaron, text: "Try a new hobby or recipe"),
                Answer(dessert: .LemonTart, text: "Plan for next week so you feel prepared")
             ]
            ),
        Question(
            text: "Which of these words describe you best? (Choose as many as you want!)",
            questionType: .multipleChoice,
            answers: [
                Answer(dessert: .LemonTart, text: "Creative"),
                Answer(dessert: .Brownie, text: "Loyal"),
                Answer(dessert: .LemonTart, text: "Spontaneous"),
                Answer(dessert: .IceCream, text: "Calm"),
                Answer(dessert: .StrawberryMacaron, text: "Outgoing"),
                Answer(dessert: .IceCream, text: "Thoughtful")
             ]
            ),
        Question(
            text: "On a scale from 1 (super chill) to 10 (total thrill-seeker)",
            questionType: .rangedQuestion,
            answers: [
                Answer(dessert: .Brownie, text: "1"),
                Answer(dessert: .Brownie, text: "2"),
                Answer(dessert: .Brownie, text: "3"),
                Answer(dessert: .IceCream, text: "4"),
                Answer(dessert: .IceCream, text: "5"),
                Answer(dessert: .IceCream, text: "6"),
                Answer(dessert: .StrawberryMacaron, text: "7"),
                Answer(dessert: .StrawberryMacaron, text: "8"),
                Answer(dessert: .LemonTart, text: "9"),
                Answer(dessert: .LemonTart, text: "10")
             ]
            )
    ]
    
     func selectAnswer(_ answer: Answer) {
        selectedAnswers.append(answer)
    }
    
    
}
