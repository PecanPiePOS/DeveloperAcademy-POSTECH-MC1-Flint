//
//  BeforeGuideStartView.swift
//  MC1
//
//  Created by uiskim on 2022/04/10.
//

import SwiftUI

struct BeforeGuideStartView: View {
    @State var BackButton = false
    @State var GoGuideStartview = false
    var body: some View {
        if GoGuideStartview{
            GuideMainView()
        }else if BackButton{
            OrderCheckView()
        }else{
            ZStack {
                Image("BeforeGuideStartView")
                
                Button {
                    BackButton=true
                } label: {
                    Image("BackButton")
                        .padding(.bottom, 750.0)
                        .padding(.trailing, 200)
                }

                
                Button {
                    GoGuideStartview=true
                } label: {
                    Image("GuideStartButton")
                }.padding(.top, 700.0)

            }
            .navigationBarHidden(true)
        }
    }
}

struct BeforeGuideStartView_Previews: PreviewProvider {
    static var previews: some View {
        BeforeGuideStartView()
    }
}
