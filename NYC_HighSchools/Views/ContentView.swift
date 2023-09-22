//
//  ContentView.swift
//  NYC_HighSchools
//
//  Created by Syed Raza on 9/22/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = SchoolViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.allSchools, id: \.self) { school in
                let satsForSchool = viewModel.allSAT.filter { $0.dbn == school.dbn }
                NavigationLink(destination: SchoolDetails(school: school, sats: satsForSchool)) {
                    Text(school.name)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                        .padding(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .listStyle(PlainListStyle())
            .navigationTitle("NYC School List")
            .onAppear {
                viewModel.getSchools()
                viewModel.getSAT()
            }
        }
        .background(Color.gray.opacity(0.1).ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
