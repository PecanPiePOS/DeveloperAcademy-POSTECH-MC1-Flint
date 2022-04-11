//
//  GuideStartView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideStartView: View {
    @State var isGuideTakeOutChoiceView = false
    var body: some View {
        if isGuideTakeOutChoiceView{
            GuideTakeOutChoiceView()
        } else {
            ZStack {
                Color.whiteColor
                    .ignoresSafeArea()
                
                VStack {
                    Image("MainAdvertisement")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .background(Color.primaryColor)
                    
                    Spacer()
                    
                    HStack{
//                        altImage
//                            .foregroundColor(.grayColor)
//                            .frame(width: 150, height: 250, alignment: .center)
//                            .border(.black)
                        
                        VStack{
                            Text("QR코드를 스캔하세요")
                            Image(systemName: "qrcode")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                            Image(systemName: "")
                        }
                        .frame(width: 150, height: 150, alignment: .center)
                        .foregroundColor(.grayColor)
                        .background(Color.primaryColor)
                        
                        VStack {
                            Button(action: {isGuideTakeOutChoiceView=true}) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 200, height: 100, alignment: .center)
                                        .foregroundColor(.white)
                                        .border(Color.grayColor)
                                    
                                    Text("주문하기")
                                        .foregroundColor(.grayColor)
                                        .font(.titleFont)
                                }
                            }
                            
                            HStack{
                                Text("언어")
                                    .foregroundColor(.grayColor)
                                    .font(.mainFont)
                                    .frame(width: 95, height: 50)
                                    .border(Color.grayColor)
                                
                                Text("도움 기능")
                                    .foregroundColor(.grayColor)
                                    .font(.mainFont)
                                    .frame(width: 95, height: 50)
                                    .border(Color.grayColor)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct GuideStartView_Previews: PreviewProvider {
    static var previews: some View {
        GuideStartView()
    }
}
