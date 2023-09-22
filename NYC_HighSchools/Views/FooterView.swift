//
//  FooterView.swift
//  NYC_HighSchools
//
//  Created by Syed Raza on 9/22/23.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        ZStack{
            Color.black
                .frame(width: UIScreen.main.bounds.width, height: 80)
            HStack(alignment: .bottom){
                Button(action: { print("Pressed house") })
                {
                    Image(systemName: "house")
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action: { print("Pressed house") })
                {
                    Image(systemName: "dollarsign.arrow.circlepath")
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action: { print("Pressed house") })
                {
                    Image(systemName: "arrow.left.arrow.right")
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action: { print("Pressed house") })
                {
                    Image(systemName: "brain.head.profile")
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
