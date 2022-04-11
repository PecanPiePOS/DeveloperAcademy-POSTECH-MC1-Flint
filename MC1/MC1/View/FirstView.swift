//
//  FirstView.swift
//  MC1
//
//  Created by KYUBO A. SHIM on 2022/04/11.
//

import SwiftUI

struct FirstView: View {
    
    @ObservedObject var locationManager = LocationManager.shared
    var body: some View {
        Group {
            if locationManager.userLocation == nil {
                OnboardingStartView()
//                    .transition(.slide)
            } else {
                StartView()
//                    .transition(.slide)
//            if let location = locationManager.userLocation {
//                Text("\(location)")
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
