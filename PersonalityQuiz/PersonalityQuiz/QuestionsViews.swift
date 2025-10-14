//
//  QuestionsViews.swift
//  PersonalityQuiz
//
//  Created by Masimo Stephenson on 10/13/25.
//

import SwiftUI

/* `TitleView`, `QuestionFlowView`, `RangedQuestionSubview`, `MultipleQuestionSubview`, `SingleQuestionSubview`, and `ResultsView`. `QuestionFlowView` */

struct QuestionFlowView: View {
    var body: some View {
        SingleQuestionSubview(question: "HI", Options: ["1", "2", "3", "4"])
    }
}

struct RangedQuestionSubview: View {
    @Environment(QuizManager.self) var manager
    let question: String
    @State private var rangeAnswer = 0.0
    var body: some View {
        ZStack {
            NavigationStack {
                BackgroundView()
                VStack {
                    Text(question).font(.headline)
                        .foregroundStyle(.white.secondary)
                        .padding(10)
                    Text(
                        "\(rangeAnswer.formatted(.number.precision(.fractionLength(0)))) out of 10"
                    )
                    .foregroundStyle(.white)
                    .font(.title2).bold()
                    Slider(value: $rangeAnswer, in: 0...10, step: 1.0) {
                        Text("Range")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("10")
                    }
                    .onChange(of: rangeAnswer) {
                        rangeAnswer = rangeAnswer.rounded()
                    }
                    .tint(.white)
                    .frame(maxWidth: .infinity)
                }.padding(.horizontal, 40)
            }
            .toolbar {
//                NavigationLink
            }
        }
    }
}

struct SingleQuestionSubview: View {
    var question: String
    var Options: [String]
    @State private var choice = ""
    var body: some View {
        if Options.count != 4 {
            Text(
                "Incorrect initilization of Multiple Questions. Must be only 4 questions. No more, no less."
            )
        } else {
            NavigationStack {
                ZStack {
                    BackgroundView()
                    VStack {
                        Text(question)
                            .font(.title2)
                            .foregroundStyle(.white.secondary)
                            .bold()
                        Picker("Choose", selection: $choice) {
                            ForEach(Options, id: \.self) { text in
                                Text(text).font(.system(size: 25))
                            }
                        }
                        .pickerStyle(.menu).tint(.white)
                    }
                }
            }
        }
    }
}

struct MultipleQuestionSubview: View {
    let questions: [String]
    @State private var answers: [Bool]

    init(questions: [String]) {
        self.questions = questions
        _answers = State(
            initialValue: Array(repeating: false, count: questions.count)
        )
    }

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                ForEach(0..<questions.count, id: \.self) { count in
                    Toggle(questions[count], isOn: $answers[count])
                        .font(.headline)
                }.tint(.white)
                    .foregroundStyle(.white.secondary)
            }
            .padding(.horizontal, 40)
        }
    }
}

struct ResultsView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {

                Text(
                    """
                    YOU ARE...
                    """
                )
                .foregroundStyle(.white.secondary)
                .font(.largeTitle.weight(.heavy))
                .multilineTextAlignment(.center)
                Rectangle()
                    .frame(height: 200).hidden()
                Text("Result")
                    .font(.title).bold()
                    .foregroundStyle(.white)

                Spacer()
            }
            .padding(.horizontal, 45)
            .padding(.vertical, 80)
        }
    }
}

#Preview {
    SingleQuestionSubview(
        question: "What would you do?",
        Options: ["1", "2", "3", "4"]
    )
}

#Preview {
    MultipleQuestionSubview(questions: [
        "Would you eat a dog?",
        "Would you swim in the ocean without a life jacket?",
    ])
}

#Preview {
    ResultsView()
}

#Preview {
//    RangedQuestionSubview( question: "Do you like pool?")
}

#Preview {
    QuestionFlowView()
}
