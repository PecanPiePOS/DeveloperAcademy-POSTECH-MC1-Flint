//
//  GuidePayChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuidePayView: View {
    var body: some View {
        ZStack {
            Color.whiteColor
                .ignoresSafeArea()
            
            VStack {
                Text("아래 결제 단말기에서 결제를 진행해 주세요")
                    .font(.titleFont)
                    .foregroundColor(.grayColor)
                
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 170, height: 30, alignment: .center)
                        .foregroundColor(.red)
                    
                    Text("IC신용/체크카드 사용시")
                }
                
                Text("카드를 화살표 방향으로 투입구에 넣어주세요")
                    .foregroundColor(.grayColor)
                    .font(.mainFont)
                Text("결제 오류시, 카드를 긁어주세요")
                    .foregroundColor(.grayColor)
                    .font(.mainFont)
                
                altImage
                    .frame(width: 200, height: 200, alignment: .center)
                    .foregroundColor(.grayColor)
                
                Spacer()
            }
        }
    }
}

struct GuidePayChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        GuidePayView()
    }
}
