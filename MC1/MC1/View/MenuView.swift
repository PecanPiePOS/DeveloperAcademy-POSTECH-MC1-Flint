//
//  MenuView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/06.
//

import SwiftUI

struct MenuView: View {
    @State var menu = mcdonaldMenu
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationView{
            ScrollView {
                HStack {
                    Text("어떤 메뉴를\n드시고 싶으세요?")
                        .font(Font.titleFont)
                        .foregroundColor(Color.whiteColor)
                    Spacer()
                }
                .padding(.bottom, 30)
                
                VStack(alignment: .leading) {
                    Section("추천 메뉴") {
                        LazyVGrid(columns: columns) {
                            ForEach($menu){ $menu in
                                if menu.tag.contains("추천"){
                                    NavigationLink(destination: MenuCheckView(menu: $menu)) {
                                        MenuCellView(menu: $menu)
                                    }
                                }
                            }
                        }
                    }
                    .font(Font.mainFont)
                    .foregroundColor(Color.whiteColor)
                    .padding(.bottom)
                    
                    Section("소고기 버거") {
                        LazyVGrid(columns: columns) {
                            ForEach($menu){ $menu in
                                if menu.tag.contains("소고기"){
                                    NavigationLink(destination: MenuCheckView(menu: $menu)) {
                                        MenuCellView(menu: $menu)
                                    }
                                }
                            }
                        }
                    }
                    .font(Font.mainFont)
                    .foregroundColor(Color.whiteColor)
                    .padding(.bottom)
                    
                    Section("치킨 버거") {
                        LazyVGrid(columns: columns) {
                            ForEach($menu){ $menu in
                                if menu.tag.contains("치킨"){
                                    NavigationLink(destination: MenuCheckView(menu: $menu)) {
                                        MenuCellView(menu: $menu)
                                    }
                                }
                            }
                        }
                    }
                    .font(Font.mainFont)
                    .foregroundColor(Color.whiteColor)
                    .padding(.bottom)
                    
                    Section("새우 버거") {
                        LazyVGrid(columns: columns) {
                            ForEach($menu){ $menu in
                                if menu.tag.contains("새우"){
                                    NavigationLink(destination: MenuCheckView(menu: $menu)) {
                                        MenuCellView(menu: $menu)
                                    }
                                }
                            }
                        }
                    }
                    .font(Font.mainFont)
                    .foregroundColor(Color.whiteColor)
                    .padding(.bottom)
                }
            }
            .padding()
            .background(Color.grayColor)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
