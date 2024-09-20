//
//  ContentView.swift
//  ProgressiveBlurExample
//
//  Created by Martin Höller on 20.09.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            colorGrid
            progressiveBlur
            title
        }
        .frame(width: 400, height: 500)
    }

    @ViewBuilder
    private var colorGrid: some View {
        ScrollView(.vertical) {
            Grid(horizontalSpacing: 10) {
                ForEach(0..<20) { _ in
                    GridRow {
                        ForEach(0..<5) { _ in
                            Color.random.frame(width: 50, height: 50)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 80)
        }
        .scrollIndicators(.never)
    }

    @ViewBuilder
    private var progressiveBlur: some View {
        VisualEffectView(material: .hudWindow, blendingMode: .withinWindow, state: .active)
            .frame(height: 80)
            .mask(alignment: .top) {
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .black.opacity(1.0), location: 0.53),
                        .init(color: .black.opacity(0.95), location: 0.7),
                        .init(color: .black.opacity(0.6), location: 0.85),
                        .init(color: .black.opacity(0.0), location: 1.0)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
    }

    @ViewBuilder
    private var title: some View {
        Text("Title")
            .fontWeight(.semibold)
            .frame(height: 60)
    }
}

extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}

#Preview {
    ContentView()
}
