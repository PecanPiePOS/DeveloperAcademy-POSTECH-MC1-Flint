//
//  LaunchView.swift
//  MC1
//
//  Created by KYUBO A. SHIM on 2022/04/12.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        VStack{
            Spacer()
            
            Image("MainImage")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .foregroundColor(.primaryColor)
                .padding(.bottom, -60)
            
            Spacer()
            
            Text("from")
                .font(.system(size: 15, weight: .medium))
                .italic()
                .foregroundColor(.gray)
                .opacity(0.6)
                .padding(.bottom, -10)
            
            Image("Flint")
                .resizable()
                .scaledToFit()
                .frame(width: 100, alignment: .center)
                .opacity(0.8)
                .padding(.bottom, 40)
            
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
