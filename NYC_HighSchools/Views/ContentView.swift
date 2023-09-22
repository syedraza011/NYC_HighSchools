//
//  ContentView.swift
//  NYC_HighSchools
//
//  Created by Syed Raza on 9/22/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = SchoolViewModel()
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach (viewModel.allSchools, id: \.self) { school in
                    Text(school.name)
                    ForEach (viewModel.allSAT, id: \.self) { sat in
                        Text(sat.maths)
                    }
                }
            }
        }.onAppear {
            viewModel.getSchools()
            viewModel.getSAT()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
