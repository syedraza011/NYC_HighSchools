//
//  SchoolDetails.swift
//  NYC_HighSchools
//
//  Created by Syed Raza on 9/22/23.
//


import Foundation
import Combine

// making use of states/ status to keep user update when data is being loaded/ updated 
enum Status {
    case initial, loading, loaded, error, empty
}

class SchoolViewModel: ObservableObject {
    private var cancellable = Set<AnyCancellable>()
    private let service:SchoolServiceProtocol
    
    init(service: SchoolServiceProtocol) {
        self.service = service
    }
    //property wrappers
    @Published var data: [SchoolData] = [SchoolData]()
    @Published var status: Status = .initial
    @Published var filteredSchools: [SchoolData] = []
    
    // getting all the school data
    func getSchools() {
        status = .loading
        service.fetchSchools()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    self?.status = .error
                    print(String(describing: err))
                }
            } receiveValue: { [weak self] response in
                self?.data = response
            
                if response.count > 0 {
                    self?.status = .loaded
                } else {
                    self?.status = .empty
                }
            }
            .store(in: &cancellable)
    }
}

// getting all the SAT scores
class SATViewModel: ObservableObject {
    private var cancellable = Set<AnyCancellable>()
    private let service:SchoolServiceProtocol
    
    init(service: SchoolServiceProtocol) {
        self.service = service
    }
    
    @Published var data: [SATData] = [SATData]()
    @Published var status: Status = .initial
    
    func getSAT(_ dbn: String) {
        status = .loading
        service.fetchSAT(dbn)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    self?.status = .error
                    print(String(describing: err))
                }
            } receiveValue: { [weak self] response in
                self?.data = response
                
                if response.count > 0 {
                    self?.status = .loaded
                } else {
                    self?.status = .empty
                }
            }
            .store(in: &cancellable)
    }
}

