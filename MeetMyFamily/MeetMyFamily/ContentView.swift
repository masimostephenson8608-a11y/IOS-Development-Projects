//
//  ContentView.swift
//  MeetMyFamily
//
//  Created by Masimo Stephenson on 10/9/25.
//

import SwiftUI

struct FamilyMember {
    let name: String
    let age: Int
    let description: String
}

struct ContentView: View {
    @State var Family = [FamilyMember(name: "Mariana", age: 49,
                                  description: "Mariana is my mother and she is from Argentina. She tends to yell by default regardless of her state of mind or mood. She likes to go on vacation and visit her Family."),
                         FamilyMember(name: "Kyle", age: 50,
                                      description: "Kyle is my father and he is very very religous. He strongly believes in the church and is very stubborn when it comes to hearing other perspectives, in other words, he is far from open-minded."),
                         FamilyMember(name: "Giovana", age: 24,
                                      description: "Giovana, or Gio for short, is my sister. She is a huge brat and is super annoying. She pairs well with the term \"Bad Temper\" and nobody likes to talk to her about much."),
                         FamilyMember(name: "Masimo", age: 17,
                                      description: "I am Masimo, I'm learning to program apps. In picture of my family, we went to Argentina for like the only time, in 2023 for Christams. This was the best vacation I ever had because I got to see my family and hangout with my cousin Fabri. I am also a brat but I'm proud to say that.")]
    var body: some View {
        VStack {
            ZStack {
                Image("MeetMyFamily")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .scaledToFit()
                    .padding(.vertical, 15)
            }
            Text("This is some of my family including cousins and immediate family")
                .font(.headline).multilineTextAlignment(.center)
                .padding(.bottom, 50)
            Text("""
For my immediate family we have:
Mariana
Kyle
Giovana
Masimo
""")
            .multilineTextAlignment(.center).font(.custom("", size: 20))
            Spacer()
        }
        .padding(.vertical, 50)
    }
}

#Preview {
    ContentView()
}
