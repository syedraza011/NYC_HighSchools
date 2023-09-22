
//  SATDetails.swift
//  NYC_HighSchools
//
//  Created by Syed Raza on 9/22/23.


import SwiftUI

struct SATCell: View {
    @StateObject var viewModel = SATViewModel(service: SchoolService())
    let dbn: String
    var body: some View {
        VStack {
            switch viewModel.status {
            case .initial, .loading:
                Text("Loading...")
            case .error:
                Text("Error.")
            case .empty:
                Text("No data available")
            case .loaded:
                ForEach(viewModel.data, id: \.self) { score in
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Reading: " + score.sat_critical_reading_avg_score)
                            .font(.title2)
                            .foregroundColor(Color.blue)
                            .padding(.bottom, 4)

                        Text("Math: " + score.sat_math_avg_score)
                            .font(.title2)
                            .foregroundColor(Color.green)
                            .padding(.bottom, 4)

                        Text("Writing: " + score.sat_writing_avg_score)
                            .font(.title2)
                            .foregroundColor(Color.orange)
                            .padding(.bottom, 4)
                    }
                    .frame(width: 200, height: 200) 
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.2), radius: 5, x: 0, y: 4)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }

            }
        }
        .onAppear {
            viewModel.getSAT(dbn)
        }
    }
}


struct SATCell_Previews: PreviewProvider {
    static var previews: some View {
        SATCell(dbn: "21K728")
    }
}
