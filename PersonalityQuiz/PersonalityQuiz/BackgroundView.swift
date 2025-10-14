//
//  BackgroundView.swift
//  PersonalityQuiz
//
//  Created by Masimo Stephenson on 10/13/25.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.50, green: 0.50, blue: 0.65),  // Approximate color for the top
                            Color(red: 0.80, green: 0.45, blue: 0.25)   // Approximate color for the bottom
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .edgesIgnoringSafeArea(.all)
                    
                    RadialGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(0.9), // Transparent white
                            Color.clear               // Fully transparent
                        ]),
                        center: .bottomLeading,
                        startRadius: 5,
                        endRadius: 400
                    )
                    .blendMode(.overlay)
                    .edgesIgnoringSafeArea(.all)
                }

    }
}

#Preview {
    BackgroundView()
}
