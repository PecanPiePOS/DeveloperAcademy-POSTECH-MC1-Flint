//
//  Restaurant.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/06.
//

import Foundation

struct Restaurant: Identifiable{
    let id = UUID()
    var name: String
    var menu: [Menu]
}

struct Menu: Identifiable{
    let id = UUID()
    var name: String
    var tag: [String]
    var price: Int
}

struct SelectedMenu: Identifiable{
    let id = UUID()
    var menu: Menu
    var quantity: Int
    var isSet: Bool
}

var selectedMenuList: [SelectedMenu] = []

let restaurantList: [Restaurant] = [ 
    Restaurant(name: "McDonald", menu: mcdonaldMenu),
    Restaurant(name: "Burger King", menu: burgerkingMenu),
]

// 가게 메뉴
let mcdonaldMenu: [Menu] = [
    Menu(name: "아라비아따 리코타 치킨 버거", tag: ["치킨"], price: 6500),
    Menu(name: "더블 빅맥", tag: ["소고기"], price: 7000),
    Menu(name: "트리플 치즈버거", tag: ["소고기"], price: 5600),
    Menu(name: "빅맥®", tag: ["추천", "소고기"], price: 4600),
    Menu(name: "맥스파이시® 상하이 버거", tag: ["추천", "치킨"], price: 4600),
    Menu(name: "1955® 버거", tag: ["추천", "소고기"], price: 5700),
    Menu(name: "더블 필레오피쉬", tag: [], price: 5000),
    Menu(name: "필레 오 피쉬", tag: [], price: 3500),
    Menu(name: "맥치킨® 모짜렐라", tag: ["치킨"], price: 4800),
    Menu(name: "맥치킨®", tag: ["치킨"], price: 3300),
    Menu(name: "더블 불고기 버거", tag: ["소고기"], price: 4400),
    Menu(name: "에그 불고기 버거", tag: ["소고기"], price: 3200),
    Menu(name: "불고기 버거", tag: ["추천", "소고기"], price: 2200),
    Menu(name: "슈슈 버거", tag: ["새우"], price: 4500),
    Menu(name: "슈비 버거", tag: ["새우", "소고기"], price: 5500),
    Menu(name: "베이컨 토마토 디럭스", tag: ["추천", "소고기"], price: 5500),
    Menu(name: "더블 쿼터파운더® 치즈", tag: ["소고기"], price: 7000),
    Menu(name: "쿼터파운더® 치즈", tag: ["소고기"], price: 5200),
    Menu(name: "치즈버거", tag: ["소고기"], price: 2300),
    Menu(name: "더블 치즈버거", tag: ["소고기"], price: 4400),
    Menu(name: "햄버거", tag: ["소고기"], price: 2000),
]

let burgerkingMenu: [Menu] = [
    Menu(name: "와퍼", tag: ["소고기"], price: 8000)
]
