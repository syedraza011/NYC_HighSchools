//
//  SchoolDetails.swift
//  NYC_HighSchools
//
//  Created by Syed Raza on 9/22/23.
//


import Foundation

struct SchoolResponse: Decodable, Identifiable,Hashable {
    let id = UUID()
    let dbn: String
    let name: String
    let city: String
    let state: String
    let zip: String
    
    
    enum CodingKeys : String, CodingKey {
        case dbn, city, zip
        case name = "school_name"
        case state = "state_code"
        
    }
}
struct SATResponse: Decodable, Hashable,Identifiable{
    let id = UUID()
    let dbn: String
    let maths: String
    let reading: String
    let writing: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case maths = "sat_math_avg_score"
        case reading = "sat_critical_reading_avg_score"
        case writing = "sat_writing_avg_score"
    }
}
