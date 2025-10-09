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
    
    
    static let Family = [Mariana, Kyle, Damiana, Giovana, Masimo]
    
    static let Mariana = FamilyMember(name: "Mariana", age: 49,
                                      description: "Mariana is my mother and she is from Argentina. She tends to yell by default regardless of her state of mind or mood. She likes to go on vacation and visit her Family.")
    static let Kyle = FamilyMember(name: "Kyle", age: 50,
                                   description: "Kyle is my father and he is very very religous. He strongly believes in the church and is very stubborn when it comes to hearing other perspectives, in other words, he is far from open-minded.")
    
    static let Damiana = FamilyMember(name: "Damiana", age: 25,
                                      description: "Damiana, or Dami, is my sister. She is the only sibling born before 2000. She is somewhat of a brat and has an adorable baby, who both live with us, as well as her Boyfriend Nojo. She is my favorite sibling by far.")
    
    static let Giovana = FamilyMember(name: "Giovana", age: 24,
                                      description: "Giovana, or Gio for short, is my sister. She is a huge brat and is super annoying. She pairs well with the term \"Bad Temper\" and nobody likes to talk to her about much.")
    static let Masimo = FamilyMember(name: "Masimo", age: 17,
                                     description: "I am Masimo, I'm learning to program apps. In picture of my family, we went to Argentina for like the only time, in 2023 for Christams. This was the best vacation I ever had because I got to see my family and hangout with my cousin Fabri. I am also a brat but I'm proud to say that.")
}

struct ContentView: View {
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink(destination: MoreInfoView(person: FamilyMember.Mariana)) {
                        VStack {
                            Image(.mariana).resizable()
                                .scaledToFit()
                            Text(FamilyMember.Mariana.name).font(.headline.weight(.heavy)).foregroundStyle(.white)
                        }
                    }
                    .frame(maxWidth: 180, maxHeight: 200)
                    .background(Rectangle().frame(width: 180, height: 225))
                    .padding(5)
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: MoreInfoView(person: FamilyMember.Kyle)) {
                        VStack {
                            Image(systemName: "person.fill.xmark").resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .padding(.vertical, 34)
                            Text(FamilyMember.Kyle.name).font(.headline.weight(.heavy)).foregroundStyle(.white)
                        }
                    }
                     .frame(maxWidth: 180, maxHeight: 200)
                        .background(Rectangle().frame(width: 180, height: 225))
                        .padding(5)
                    
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 15)
                HStack {
                    //                Rectangle().frame(width: 180, height: 225)
                    //                Spacer()
                    //                Rectangle().frame(width: 180, height: 225)
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 15)
                HStack {
                    //                Rectangle().frame(width: 180, height: 225)
                    //                Spacer()
                    //                Rectangle().frame(width: 180, height: 225)
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 15)
            }
        }
    }
}

#Preview {
    ContentView()
}
