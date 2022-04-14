//
//  GuidePayMethodChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuidePayMethodChoiceView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @Binding var isFinish: Bool
    
    var body: some View {
        ZStack{
            Color.whiteColor
                .ignoresSafeArea()
            
            VStack {
                Text("결제 방법을 선택해 주세요")
                    .foregroundColor(.grayColor)
                    .font(.titleFont)
                
                ScrollView{
                    LazyVGrid(columns: columns){
                        Button(action: {isFinish=true}) {
                            VStack {
                                Image(systemName: "creditcard")
                                    .resizable()
                                    .scaledToFit()
                                Text("카드 결제")
//                                        .font(.mainFont)
                                    .font(.caption)
                            }
                            .foregroundColor(.grayColor)
                            .padding()
                            .frame(width: 120, height: 120, alignment: .center)
                            .background(Color.primaryColor)
                            .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        }
                        
                        Button(action: {isFinish=true}) {
                            VStack {
                                Image(systemName: "iphone")
                                    .resizable()
                                    .scaledToFit()
                                Text("모바일 상품권")
//                                        .font(.mainFont)
                                    .font(.caption)
                            }
                            .foregroundColor(.grayColor)
                            .padding()
                            .frame(width: 120, height: 120, alignment: .center)
                            .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        }
                    }
                }
            }
        }
        .frame(height: 650)
    }
}

struct GuidePayMethodChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        GuidePayMethodChoiceView(isFinish: .constant(false))
    }
}
