//
//  SATDetails.swift
//  NYC_HighSchools
//
//  Created by Syed Raza on 9/22/23.
//

import SwiftUI

struct SATDetails: View {
   
    let sats: [SATResponse]
    var body: some View {
        VStack{
            ForEach(sats, id: \.self) { score in
                
                VStack{
                    
                      
                    Text("Reading:           \(score.reading)")
                        .font(.headline)
                    Text("Writing:             \(score.writing)")
                        .font(.headline)
                    Text("Mathematics:  \(score.maths)")
                        .font(.headline)
                }
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                    
                }
                
            }
        }
    }

struct SATDetails_Previews: PreviewProvider {
    static var previews: some View {
        let mockSat = SATResponse(dbn: "123", maths: "54.5", reading: "98.7", writing: "87.5")

        SATDetails(sats: [mockSat])
    }
}
