////
////  FetchWinners.swift
////  Club Petanque
////
////  Created by Kristian Emil on 04/05/2024.
////
//
//
//import Foundation
//
//public func fetchEvents() {
//    let apiKey = "YOUR_API_KEY"  // Remember to secure your API key in a safe place
//    let baseId = "Yapp0duO8VQeITcp8C"
//    let tableName = "Winners"
//
//    guard let url = URL(string: "https://api.airtable.com/v0/\(baseId)/\(tableName)") else {
//        print("Invalid URL")
//        return
//    }
//
//    var request = URLRequest(url: url)
//    request.httpMethod = "GET"
//    request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
//    request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        if let error = error {
//            print("Error: \(error)")
//            return
//        }
//
//        guard let httpResponse = response as? HTTPURLResponse,
//              httpResponse.statusCode == 200,
//              let data = data else {
//            print("Invalid response or data")
//            return
//        }
//
//        do {
//            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//               let records = json["records"] as? [[String: Any]] {
//                for record in records {
//                    if let fields = record["fields"] as? [String: Any],
//                       let eventName = fields["Event Name"] as? String,
//                       let winner = fields["Winner"] as? String,
//                       let eventDate = fields["Date"] as? String {
//                        print("Event: \(eventName), Winner: \(winner), Date: \(eventDate)")
//                    }
//                }
//            }
//        } catch {
//            print("Error parsing JSON: \(error)")
//        }
//    }
//    task.resume()
//}
//
//// Call the function
