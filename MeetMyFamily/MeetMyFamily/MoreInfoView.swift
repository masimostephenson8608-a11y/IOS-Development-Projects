//
//  MoreInfoView.swift
//  MeetMyFamily
//
//  Created by Masimo Stephenson on 10/9/25.
//

import SwiftUI

struct MoreInfoView: View {
    let person: FamilyMember
    var body: some View {
        VStack(alignment: .center) {
            Text("\(person.name)")
                .font(.largeTitle.weight(.heavy))
                .padding(.top, 75)
            Text("")
            Text("\(person.age) years old")
                .font(.headline)
            Spacer()
            
            Text("Details about \(person.name):")
                .font(.custom("Arial Black", size: 20))
                .padding(.bottom, 25)
            Text(person.description)
                .padding(.bottom, 100)
                .lineSpacing(15)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(25)
    }
}

#Preview {
    MoreInfoView(person: FamilyMember.Mariana)
}
