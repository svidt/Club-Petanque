//
//  ContentView.swift
//  Club Petanque
//
//  Created by Kristian Emil on 04/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TrophyView()
                .tabItem {
                    Label("Trophy", systemImage: "trophy")
                }
            ScoreView()
                .tabItem {
                    Label("History", systemImage: "list.bullet.clipboard")
                }
        }
    }
}

#Preview {
    ContentView()
}


