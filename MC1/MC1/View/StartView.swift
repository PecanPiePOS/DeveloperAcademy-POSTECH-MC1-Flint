//
//  StartView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/07.
//

import SwiftUI

struct StartView: View {
    @State var GoHelpPageView = false
    @State var GoStoreChoceView = false
    
    var body: some View {
        if GoHelpPageView{
            HelpPageView()
        }else if GoStoreChoceView{
            StoreChoiceView()
        }else {
            VStack(alignment: .center){
                Text("안녕하세요! 어떤 매장의 안내가 필요하신가요?")
                //title에 .kerning .tracking -2정도 필요한듯
                    .font(.system(size: 32, weight: .black, design: .rounded))
                    .lineLimit(2)
                    .allowsTightening(true)
                    .frame(width: 303, height: 78, alignment: .leading)
                    .padding(.bottom, 100)
                    .padding(.top, 80)

                Button {
                    GoStoreChoceView = true
                } label: {
                    Image("StartViewButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 344, height: 146, alignment: .center)
                        .padding(.bottom, 40)
                }

                VStack(alignment: .leading){
                    Text("혼잡하지 않은 곳에서 메뉴 선택\n을 진행해 주세요")
                        .font(.system(size: 22, weight: .semibold))
                        .lineLimit(2)
                        .allowsTightening(true)
                        .multilineTextAlignment(.leading)
                        .frame(width: 274, height: 54)
                        
                    Text("현재 내 주변의 매장을 자동으로 탐색\n해서 키오스크 사용 방법을 익혀볼 수\n있어요.")
                        .font(.system(size: 18, weight: .medium))
                        .lineLimit(3)
                        .frame(width: 263, height: 81)
                        .multilineTextAlignment(.leading)
                }.padding(.bottom, 90)
                
                HStack {
                    Spacer()
                    Button {
                        GoHelpPageView = true
                    } label: {
                        Image("HelpButton")
                            .frame(width: 84, height: 27, alignment: .trailing)
                    }
                }
                .padding()
            }
        
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
