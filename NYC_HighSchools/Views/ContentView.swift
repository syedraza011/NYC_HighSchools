//
//  ContentView.swift
//  NYC_HighSchools
//
//  Created by Syed Raza on 9/22/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel:SchoolViewModel = SchoolViewModel(service: SchoolService())
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    switch viewModel.status {
                    case .initial, .loading:
                        Text("Loading...")
                    case .error:
                        Text("Error.")
                    case .empty:
                        Text("Nothing to load.")
                    case .loaded:
                        listView(viewModel.data)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("NYC Schools List")
        }
        .onAppear {
            viewModel.getSchools()
        }
    }
    
        private func listView(_ data:[SchoolData]) -> some View {
            ForEach(data, id: \.self) { school in

                NavigationLink(destination: SATCell(dbn: school.dbn)) {
                    HStack {
                        Text(school.school_name)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .shadow(radius: 10)
                }

            }
        }

 
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

