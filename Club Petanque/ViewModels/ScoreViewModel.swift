//
//  EventViewModel.swift
//  Club Petanque
//
//  Created by Kristian Emil on 05/05/2024.
//

import SwiftUI

class ScoreViewModel: ObservableObject {
    @Published var events: [EventRecord] = []
    
    private let apiKey: String
    private let baseID: String
    private let tableName: String

    init() {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API Key not found in Info.plist")
        }
        self.apiKey = key
        
        guard let base = Bundle.main.object(forInfoDictionaryKey: "BASE_ID") as? String else {
            fatalError("Base ID not found in Info.plist")
        }
        self.baseID = base
        
        guard let table = Bundle.main.object(forInfoDictionaryKey: "TABLE") as? String else {
            fatalError("Table Name not found in Info.plist")
        }
        self.tableName = table
    }
    
    func fetchEvents() {
        guard let url = URL(string: "https://api.airtable.com/v0/\(baseID)/\(tableName)") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(AirtableResponse.self, from: data)
                    DispatchQueue.main.async {
                        // Sort by date assuming 'Date' is a string in an appropriate format
                        self.events = decodedResponse.records.sorted {
                            $0.fields.Date > $1.fields.Date
                        }
                    }
                } catch {
                    print("Decoding or sorting failed: \(error)")
                }
            } else if let error = error {
                print("Fetch failed: \(error.localizedDescription)")
            }
        }.resume()
    }
}
