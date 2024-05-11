//
//  TrophyView.swift
//  Club Petanque
//
//  Created by Kristian Emil on 04/05/2024.
//

import SplineRuntime
import SwiftUI

struct TrophyView: View {
    
    @ObservedObject var viewModel = TrophyViewModel()
    
    var body: some View {
        
        VStack {
            OnboardTrophyView()
                .frame(height: 500)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                HStack {
                    Text(viewModel.trophyHolder?.fields.Name ?? "No Winner")
                        .font(.title.bold())
                    
                    Spacer()
                    
                    Text("\(Date.now.formatted(date: .abbreviated, time: .omitted))").font(.subheadline)
                }
                Text(viewModel.trophyHolder?.fields.Event ?? "Details about the event and the winner will appear here.")
                                    .foregroundStyle(.secondary)
                
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button {
                print("Winner button tapped!")
            } label: {
                Text("Show Winner")
                    .fontWeight(.bold)
                    .padding(4)
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(.pink)
            .padding()
            
            Spacer()
        }
        .onAppear {
                    viewModel.fetchTrophyHolder()
                }
    }
}

#Preview {
    TrophyView()
}

struct OnboardTrophyView: View {
    var body: some View {
        // fetching from cloud
        let url = URL(string: "https://build.spline.design/0mgmvdAoUxVjrci-HPWS/scene.splineswift")!
        
        // // fetching from local
        // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!
        
        try? SplineView(sceneFileURL: url)
    }
}
