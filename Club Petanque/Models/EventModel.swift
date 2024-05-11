//
//  EventModel.swift
//  Club Petanque
//
//  Created by Kristian Emil on 05/05/2024.
//

import Foundation

struct EventRecord: Codable, Identifiable {
    var id: String
    var fields: EventFields
    var createdTime: String
}

struct EventFields: Codable {
    var Name: String
    var Event: String
    var Location: String
    var Date: String
    var Picture: [AirtableAttachment]?
}

struct AirtableAttachment: Codable {
    var id: String
    var url: String
    var filename: String
}

struct AirtableResponse: Codable {
    var records: [EventRecord]
}

