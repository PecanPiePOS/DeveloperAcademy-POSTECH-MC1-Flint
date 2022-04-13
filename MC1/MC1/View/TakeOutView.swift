//
//  TakeOutView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/06.
//

import SwiftUI

struct TakeOutView: View {
    @State var isStoreChoiceView = false
    
    @State var isMenuView = false
    @State var isTakeOut = false
    
    var body: some View {
        if isMenuView{
            MenuView(isTakeOut: $isTakeOut)
        }else if isStoreChoiceView{
            StoreChoiceView()
        }else{
            VStack{
                HStack {
                    VStack {
                        Button(action: {
                            isStoreChoiceView=true
                        }) {
                            Image("BackButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 122)
                        }
                    }
                    Spacer()
                    Image("ProgressBar2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 147)
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer().frame(width: 210)
                    Text("메뉴 선택하기")
                }
                .padding(.bottom, 30)
                
                HStack {
                    Text("매장에서 드시고 싶으신가요?\n아니면 포장하고 싶으신가요?")
                        .font(Font.titleFont)
                        .foregroundColor(Color.whiteColor)
                    Spacer()
                }
                .padding(.bottom, 30)
                
                Spacer()
                
                // 매장에서 먹기/포장하기
                HStack {
                    Button(action: {
                        isTakeOut=false
                        isMenuView=true
                    }) {
                        Text("매장")
                    }
                    
                    Button(action: {
                        isTakeOut=true
                        isMenuView=true
                    }){
                        Text("포장")
                    }
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct TakeOutView_Previews: PreviewProvider {
    @State static var restaurant = Restaurant(name: "맥도날드", menu: mcdonaldMenu)
    static var previews: some View {
        TakeOutView()
    }
}
