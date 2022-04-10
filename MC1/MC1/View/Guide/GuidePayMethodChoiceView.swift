//
//  GuidePayMethodChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuidePayMethodChoiceView: View {
    @State var isGuidePayView = false
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        if isGuidePayView{
            GuidePayView()
        } else {
            ZStack{
                Color.whiteColor
                    .ignoresSafeArea()
                
                VStack {
                    Text("결제 방법을 선택해 주세요")
                        .foregroundColor(.grayColor)
                        .font(.titleFont)
                    
                    ScrollView{
                        LazyVGrid(columns: columns){
                            Button(action: {isGuidePayView=true}) {
                                VStack {
                                    Image(systemName: "creditcard")
                                        .resizable()
                                        .scaledToFit()
                                    Text("카드 결제")
                                        .font(.mainFont)
                                }
                                .foregroundColor(.grayColor)
                                .padding()
                                .frame(width: 120, height: 120, alignment: .center)
                            }
                            
                            Button(action: {isGuidePayView=true}) {
                                VStack {
                                    Image(systemName: "iphone")
                                        .resizable()
                                        .scaledToFit()
                                    Text("모바일 상품권")
                                        .font(.mainFont)
                                }
                                .foregroundColor(.grayColor)
                                .padding()
                                .frame(width: 120, height: 120, alignment: .center)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct GuidePayMethodChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        GuidePayMethodChoiceView()
    }
}
