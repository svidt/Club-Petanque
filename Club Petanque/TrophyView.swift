//
//  TrophyView.swift
//  Club Petanque
//
//  Created by Kristian Emil on 04/05/2024.
//

import SplineRuntime
import SwiftUI

struct TrophyView: View {
    
    @State private var showTrophy = false
    @ObservedObject var viewModel = TrophyViewModel()
    
    var body: some View {
        
        VStack {
            OnboardTrophyView()
                .frame(height: 500)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 12) {
                
//                if let image = viewModel.trophyHolder?.fields.Picture?.first {
//                    AsyncImage(url: URL(string: image.url)) { image in
//                        image.resizable().aspectRatio(contentMode: .fit)
//                    } placeholder: {
//                        Color.gray
//                    }
//                    .frame(height: 100)
//                    .cornerRadius(10)
//                }
                
                Text(viewModel.trophyHolder?.fields.Name ?? "Finding Winner")
                    .font(.largeTitle.bold())
                HStack {
                        Text(viewModel.trophyHolder?.fields.Location ?? "Location")
                            .font(.subheadline)
                        Text(viewModel.trophyHolder?.fields.Date ?? "Date")
                            .font(.caption)
                }
                Text(viewModel.trophyHolder?.fields.Event ?? "Details about the event and the winner will appear here.")
                    .foregroundStyle(.secondary)
                
//                Button {
//                    showTrophy = true
//                } label: {
//                    Image(systemName: "globe")
//                }
//                .sheet(isPresented: $showTrophy, content: {
//                    DimentialTrophy()
//                })
            }
            .padding(.horizontal)
            
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
