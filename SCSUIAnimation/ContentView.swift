//
//  ContentView.swift
//  SCSUIAnimation
//
//  Created by Andrey Karpenko  on 07.10.2023.
//

import SwiftUI

struct ContentView: View {

    @State var presentAnimation: Bool = false

    var body: some View {
        Button {
            presentAnimation.toggle()
        } label: {
            AnimatedContainer(isPressed: $presentAnimation)
        }
    }
}

struct AnimatedContainer: View {

    private let image: Image = Image(systemName: "play.fill")
    @Binding var isPressed: Bool

    var body: some View {
        HStack(spacing: -12.0) {
            if isPressed {
                image.transition(.scale.combined(with: .opacity))
            }

            image

            if !isPressed {
                image.transition(.scale.combined(with: .opacity))
            }
        }
        .onChange(of: isPressed, { if !isPressed { isPressed.toggle() } })
        .animation(isPressed ? .spring(dampingFraction: 0.5) : nil, value: isPressed)
        .font(.system(size: 100))
    }
}

#Preview {
    ContentView()
}
