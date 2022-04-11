//
//  GuideMainView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/11.
//

import SwiftUI

struct GuideMainView: View {
    @State var description = "노란 부분을 눌러주세요"
    @State var isBeforeGuideStartView = false
    var body: some View {
        if isBeforeGuideStartView{
            BeforeGuideStartView()
        } else {
            VStack{
                Button(action: {
                    isBeforeGuideStartView=true
                }) {
                    HStack {
                        Image("BackButton")
                        Spacer()
                    }
                    .padding()
                }
                Text(description)
                    .foregroundColor(.whiteColor)
                    .font(.titleFont)
                    
                Spacer()
                GuideStartView()
                    .frame(width: 300, height: 600, alignment: .center)
            }
        }

    }
}

struct GuideMainView_Previews: PreviewProvider {
    static var previews: some View {
        GuideMainView()
    }
}
