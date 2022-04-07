//
//  MenuDetailView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/06.
//

import SwiftUI

struct MenuCheckView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var menu: Menu
    
    var body: some View {
        VStack {
            ZStack {
                Color.grayColor
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("주문하신 내용이 맞나요?")
                            .font(Font.titleFont)
                            .foregroundColor(Color.whiteColor)
                        
                        Spacer()
                    }
                    .padding(.bottom, 50)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 300, height: 300, alignment: .center)
                            .foregroundColor(Color.whiteColor)
                        
                        VStack{
                            Image(menu.name)
                                .resizable()
                                .scaledToFit()
                            Text(menu.name)
                                .font(Font.mainFont)
                                .foregroundColor(Color.grayColor)
                            Text(String(menu.price)+"원")
                                .font(Font.mainFont)
                                .foregroundColor(Color.grayColor)
                        }
                        .frame(width: 300, height: 300, alignment: .center)
                        .padding()
                    }
                    
                    HStack{
                        Button(action: {}) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.whiteColor)
                                Text("아니요")
                                    .foregroundColor(Color.grayColor)
                                    .font(Font.mainFont)
                            }
                            .frame(width: 150, height: 100, alignment: .center)
                        }
                        
                        Button(action: {}) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.primaryColor)
                                Text("예")
                                    .foregroundColor(Color.grayColor)
                                    .font(Font.mainFont)
                            }
                            .frame(width: 150, height: 100, alignment: .center)
                        }
                    }
                }
                .padding(.bottom, 50)
                .padding(.horizontal)
            }
        }
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
}

struct MenuDetailView_Previews: PreviewProvider {
    @State static var menu: Menu = Menu(name: "name", tag: ["tag"], price: 1000)
    
    static var previews: some View {
        MenuCheckView(menu: $menu)
    }
}
