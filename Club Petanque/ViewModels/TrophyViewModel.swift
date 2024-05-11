//
//  TrophyViewModel.swift
//  Club Petanque
//
//  Created by Kristian Emil on 11/05/2024.
//

import SwiftUI

class TrophyViewModel: ObservableObject {
    @Published var trophyHolder: EventRecord?  // Holds details of the trophy holder
    @Published var isLoading = false
    @Published var errorMessage: String?

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
    
    func fetchTrophyHolder() {
        guard let url = URL(string: "https://api.airtable.com/v0/\(baseID)/\(tableName)") else {
            errorMessage = "Invalid URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        isLoading = true
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let data = data {
                    do {
                        let decodedResponse = try JSONDecoder().decode(AirtableResponse.self, from: data)
                        self.trophyHolder = decodedResponse.records.first  // Assuming only one record for the trophy holder
                    } catch {
                        self.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                    }
                } else if let error = error {
                    self.errorMessage = "Failed to fetch trophy data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}

