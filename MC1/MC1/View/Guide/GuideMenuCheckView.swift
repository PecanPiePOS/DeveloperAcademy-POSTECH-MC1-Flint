//
//  GuideMenuCheckView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideMenuCheckView: View {
    @State var isGuideSetSizeChoiceView = false
    @State var count: Int = 1
    @Binding var menu: Menu
    var body: some View {
        if isGuideSetSizeChoiceView{
            
        } else {
            ZStack{
                Color.whiteColor
                
                VStack{
                    Image(menu.name)
                        .resizable()
                        .scaledToFit()
                    
                    Text(menu.name)
                        .foregroundColor(.grayColor)
                        .font(.mainFont)
                    
                    Text("₩"+String(menu.price))
                        .foregroundColor(.grayColor)
                        .font(.mainFont)
                    
                    Text("영양정보")
                        .foregroundColor(.grayColor)
                        .font(.mainFont)
                        .padding(.horizontal)
                        .padding()
                        .border(Color.grayColor)
                    
                    Text("제품 추가/변경")
                        .foregroundColor(.grayColor)
                        .font(.mainFont)
                        .padding(.horizontal, 50)
                        .padding()
                        .border(Color.grayColor)
                    
                    HStack{
                        Button(action: {}) {
                            Text("-")
                                .padding()
                                .border(Color.grayColor)
                        }
                        
                        Text(String(count))
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                            .padding()
                            .padding(.horizontal, 50)
                            .border(Color.grayColor)
                        
                        Button(action: {}) {
                            Text("+")
                                .padding()
                                .border(Color.grayColor)
                        }
                    }
                    
                    Button(action: {}) {
                        Text("장바구니에 추가")
                            .foregroundColor(.grayColor)
                            .padding()
                            .padding(.horizontal, 50)
                            .background(Color.primaryColor)
                    }
                }
            }
        }
    }
}

struct GuideMenuCheckView_Previews: PreviewProvider {
    @State static var menu = Menu(name: "더블 불고기 버거", tag: [], price: 4000)
    static var previews: some View {
        GuideMenuCheckView(menu: $menu)
    }
}
