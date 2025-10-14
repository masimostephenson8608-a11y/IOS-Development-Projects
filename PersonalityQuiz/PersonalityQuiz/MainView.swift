//
//  MainView.swift
//  PersonalityQuiz
//
//  Created by Masimo Stephenson on 10/13/25.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.sunrise)
                VStack {
                    Rectangle().frame(width: 1, height: 100).hidden()
                    Text("What kind of").font(.headline.weight(.heavy))
                    Text("DESSERT")
                        .fontDesign(.monospaced).font(.largeTitle.bold())
                    Text("Are you?").font(.headline.weight(.heavy))
                    Spacer()
                }
                .padding(.vertical, 75)
            }
            .navigationTitle("")
            .toolbar {
//                NavigationLink("Begin", destination: ))
            }
        }
    }
}

#Preview {
    TitleView()
}
