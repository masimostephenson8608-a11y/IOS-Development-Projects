//
//  QuestionsViews.swift
//  PersonalityQuiz
//
//  Created by Masimo Stephenson on 10/13/25.
//

import SwiftUI

struct QuestionFlowView: View {
    @Environment(QuizManager.self) var manager
    // put your class here
    var body: some View {
        NavigationStack {
            switch manager.currentQuestion {
            case 0:
                SingleQuestionSubview(question: manager.questionList[0])
            case 1:
                MultipleQuestionSubview(questions: manager.questionList[1])
            case 2:
                RangedQuestionSubview(question: manager.questionList[2])
            case 3:
                ResultsView()
            default:
                ResultsView()
            }
        }
    }
}

struct RangedQuestionSubview: View {
    @State private var isDone = false
    @Environment(QuizManager.self) var manager
    let question: Question
    @State private var rangeAnswer = 5.0
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text(question.text).font(.headline)
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
                .disabled(isDone)
                .tint(.white)
                .frame(maxWidth: .infinity)
            }.padding(.horizontal, 40)
        }
        .toolbar {
            NavigationLink("Done", destination: QuestionFlowView())
                .simultaneousGesture(
                    TapGesture().onEnded {
                        manager.selectAnswer(
                            manager.questionList[2].answers[
                                Int(rangeAnswer) - 1
                            ]
                        )
                        isDone = true
                        manager.currentQuestion += 1
                    }
                )
        }
    }
}

struct SingleQuestionSubview: View {
    @Environment(QuizManager.self) var manager
    var question: Question
    var Options: [Answer]
    @State private var done = false
    @State private var choice: Answer

    init(question: Question) {
        self.question = question
        self.Options = question.answers
        _choice = State(initialValue: question.answers.first!)
    }
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text(question.text)
                    .font(.title2)
                    .foregroundStyle(.white.secondary)
                    .bold()
                    .multilineTextAlignment(.center)
                Picker("Choose", selection: $choice) {
                    ForEach(Options, id: \.self) { text in
                        Text(text.text).font(.system(size: 25))
                    }
                }
                .pickerStyle(.menu).tint(.white)
                .disabled(done)
            }
            .padding(40)
        }
        .navigationTitle("Dessert Quiz")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            NavigationLink("Next", destination: QuestionFlowView())
                .simultaneousGesture(
                    TapGesture().onEnded {
                        done = true
                        manager.selectAnswer(choice)
                        manager.currentQuestion += 1
                    }
                )

        }
    }
}

struct MultipleQuestionSubview: View {
    @State private var done = false
    @Environment(QuizManager.self) var manager
    let question: Question
    @State private var answers: [Bool]

    init(questions: Question) {
        self.question = questions
        _answers = State(
            initialValue: Array(
                repeating: false,
                count: questions.answers.count
            )
        )
    }

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text(question.text).font(.headline)
                    .foregroundStyle(.white.secondary)
                    .padding(10)
                ForEach(0..<question.answers.count, id: \.self) { count in
                    Toggle(
                        question.answers[count].text,
                        isOn: $answers[count]
                    ).disabled(done)
                        .font(.headline)
                }.tint(.white)
                    .foregroundStyle(.white.secondary)
            }
            .padding(.horizontal, 40)

            .navigationTitle("Dessert Quiz").navigationBarTitleDisplayMode(
                .inline
            )
            .toolbar {
                NavigationLink("Next", destination: QuestionFlowView())
                    .simultaneousGesture(
                        TapGesture().onEnded {
                            for (index, value) in answers.enumerated() {
                                if value == true {
                                    manager.selectAnswer(
                                        Answer(
                                            dessert: question.answers[index]
                                                .dessert,
                                            text: question.answers[index].text
                                        )
                                    )
                                }
                                done = true
                            }
                            manager.currentQuestion += 1
                        }
                    )
            }
        }
    }
}

struct ResultsView: View {
    @Environment(QuizManager.self) var manager
    var mostCommonDessert: String {
        let desserts = manager.selectedAnswers.map { $0.dessert.rawValue }

        var countDict: [String: Int] = [:]
        for dessert in desserts {
            countDict[dessert, default: 0] += 1
        }

        return countDict.max(by: { $0.value < $1.value })?.key ?? ""
    }

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
                Text(mostCommonDessert)
                    .font(.title).bold()
                    .foregroundStyle(.white)

                Spacer()
            }
            .padding(.horizontal, 45)
            .padding(.vertical, 80)
            .navigationBarBackButtonHidden()
        }
    }
}
