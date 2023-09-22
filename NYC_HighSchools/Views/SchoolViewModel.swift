//
//  ViewModel.swift
//  NYCHighSchools
//
//  Created by Syed Raza on 9/22/23.
//

import Foundation
import Combine

class SchoolViewModel: ObservableObject {
    let service = SchoolService()
    @Published var allSchools = [SchoolResponse]()
    @Published var allSAT = [SATResponse]()
    @Published var state: AsyncState = .initial

    var cancellables: Set<AnyCancellable> = []

    func getSchools() {
        state = .loading
        self.service.fetchSchools()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print("Fetch Failed: \(err.localizedDescription)")
                   
                }
            }, receiveValue: { [weak self] response in
               
                self?.allSchools = response
            })
            .store(in: &cancellables)
    }
    
    
    
    func getSAT() {
        state = .loading
        self.service.fetchSAT()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print("Fetch Failed: \(err.localizedDescription)")
                   
                }
            }, receiveValue: { [weak self] response in
               
                self?.allSAT = response
            })
            .store(in: &cancellables)
    }
    
    
}

