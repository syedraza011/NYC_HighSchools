//
//  SchoolDetails.swift
//  NYC_HighSchools
//
//  Created by Syed Raza on 9/22/23.
//


import Foundation

// data collecting from API for schools
struct SchoolData: Decodable, Hashable {
    let dbn: String
    let school_name: String
}
// data collecting from API for SAT scores
struct SATData: Decodable, Hashable {
    let sat_critical_reading_avg_score: String
    let sat_math_avg_score: String
    let sat_writing_avg_score: String
}

