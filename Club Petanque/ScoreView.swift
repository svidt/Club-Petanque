//
//  ScoreView.swift
//  Club Petanque
//
//  Created by Kristian Emil on 04/05/2024.
//

import SwiftUI

struct ScoreView: View {
    @ObservedObject var viewModel = ScoreViewModel()

        var body: some View {
            NavigationView {
                List(viewModel.events) { event in
                    Section {
                        VStack(alignment: .leading) {
                            Text(event.fields.Name).font(.title3).bold()
                            HStack {
                                Text(event.fields.Location).font(.caption)
                                Text(event.fields.Date).font(.caption)
                            }
                            Divider()
                            Text(event.fields.Event).font(.subheadline)
                            if let image = event.fields.Picture?.first {
                                AsyncImage(url: URL(string: image.url)) { image in
                                    image.resizable().aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(height: 100)
                                .cornerRadius(10)
                            }
                        }
                    }
                }
                .onAppear(perform: viewModel.fetchEvents)
                .navigationBarTitle("Historiske Sejre")
            }
        }
}

#Preview {
    ScoreView()
}
