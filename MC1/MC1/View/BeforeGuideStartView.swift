//
//  BeforeGuideStartView.swift
//  MC1
//
//  Created by uiskim on 2022/04/10.
//

import SwiftUI

struct BeforeGuideStartView: View {
    @Binding var isTakeOut: Bool
    @State var BackButton = false
    @State var GoGuideStartview = false
    var body: some View {
        if GoGuideStartview{
            GuideMainView(isTakeOut: $isTakeOut)
        }else if BackButton{
            OrderCheckView(isTakeOut: $isTakeOut)
        }else{
            VStack {
                HStack {
                    Button {
                        BackButton=true
                    } label: {
                        Image("BackButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 122)
                    }
                    Spacer()
                }
                
                Spacer()
                Image("BeforeGuideStartView")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 282)
                Spacer()
                
                Button {
                    GoGuideStartview=true
                } label: {
                    Image("GuideStartButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 344)
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(true)
        }
    }
}

struct BeforeGuideStartView_Previews: PreviewProvider {
    static var previews: some View {
        BeforeGuideStartView(isTakeOut: .constant(true))
    }
}
