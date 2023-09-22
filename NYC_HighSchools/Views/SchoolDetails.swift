//
//  SchoolDetails.swift
//  NYC_HighSchools
//
//  Created by Syed Raza on 9/22/23.
//


import SwiftUI
struct SchoolDetails: View {
    let school: SchoolResponse
    let sats: [SATResponse] // Update to accept an array of SATResponse

    var body: some View {
        VStack {
            Text(school.name)
                .font(.headline)
            HStack {
                Text("\(school.city),")
                Text("\(school.state),")
                Text(school.zip)
            }

            ForEach(sats, id: \.self) { sat in
                SATDetails(sats: [sat])
                    
            }
        }.font(.headline)
            .foregroundColor(.blue)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
    }
}


struct SchoolDetails_Previews: PreviewProvider {
    static var previews: some View {
        let mockData = SchoolResponse(dbn: "123", name: "ABC", city: "Brooklyn", state: "NY", zip: "10001")
        let mockSat = SATResponse(dbn: "123", maths: "54.5", reading: "98.7", writing: "87.5")

        SchoolDetails(school: mockData, sats: [mockSat])
    }
}
