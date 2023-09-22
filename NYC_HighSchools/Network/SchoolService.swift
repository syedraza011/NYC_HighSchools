//
//  SchoolDetails.swift
//  NYC_HighSchools
//
//  Created by Syed Raza on 9/22/23.
//


import Foundation
import Combine

enum APIError: LocalizedError{
    case invalidURL(String)
}
protocol SchoolServiceProtocol {
    func fetchSchools() async throws -> [SchoolResponse]
    func fetchSAT() async throws -> [SATResponse]
}


class SchoolService{
    
    struct Constants {
        static let baseURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        static let urlStringSAT="https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    }
    
    func fetchSchools() -> AnyPublisher<[SchoolResponse], Error> {
        
        guard let url = URL(string: Constants.baseURL) else {
            return Fail(error: APIError.invalidURL("URL invalid"))
                .eraseToAnyPublisher()
        } // guard end
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: [SchoolResponse].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
    
    func fetchSAT() -> AnyPublisher<[SATResponse], Error> {
        
        guard let url = URL(string: Constants.urlStringSAT) else {
            return Fail(error: APIError.invalidURL("URL invalid"))
                .eraseToAnyPublisher()
        } // guard end
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: [SATResponse].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
}
    
