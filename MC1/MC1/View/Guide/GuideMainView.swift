//
//  GuideMainView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/11.
//

import SwiftUI

struct GuideMainView: View {
    @Binding var isTakeOut: Bool
    @State var description = "노란 부분을 눌러주세요"
    @State var isBeforeGuideStartView = false
    @State var isFinish = false
    
    var body: some View {
        if isBeforeGuideStartView{
            BeforeGuideStartView(isTakeOut: $isTakeOut)
        } else if isFinish{
            FinishView()
        }else {
            VStack{
                Button(action: {
                    isBeforeGuideStartView=true
                }) {
                    HStack {
                        Image("BackButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 122)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                Text(description)
                    .foregroundColor(.whiteColor)
                    .font(.titleFont)
                    
                Spacer()
                GuideStartView(isTakeOut: $isTakeOut, isFinish: $isFinish)
            }
        }

    }
}

struct GuideMainView_Previews: PreviewProvider {
    static var previews: some View {
        GuideMainView(isTakeOut: .constant(true))
    }
}
