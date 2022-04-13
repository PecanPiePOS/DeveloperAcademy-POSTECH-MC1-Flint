//
//  OrderCancelConfirmView.swift
//  MC1
//
//  Created by Hyorim Nam on 2022/04/12.
//

import SwiftUI

//func delAction(sm: Binding<SelectedMenu>, smList: Binding<[SelectedMenu]>){
//    for i in 0...(smList.count-1) {
//        if smList[i].wrappedValue.menu.name == sm.wrappedValue.menu.name
//        {
//            smList.wrappedValue.remove(at: i)
//            selectedMenuList.remove(at: i)
//            //testSMList.remove(at: i)
//            break
//        }
//    }
//}

struct OrderCancelConfirmView: View {
    @Binding var smenu: SelectedMenu
    @State var smList = selectedMenuList
//    var dismiss: (()->Void)
    @Binding var showDelConfirmView: Bool
//    @Binding var update: Bool
    
    var body: some View {
        ZStack{
            VStack{
                Spacer();Spacer();
                Text("메뉴를 취소하시겠습니까?").font(.titleFont).foregroundColor(.grayColor)
                Spacer()
                Image(smenu.menu.name).resizable().frame(width: 120, height: 80, alignment: .center)
                Spacer()
                Text("\(smenu.menu.name) ").font(.mainFont).foregroundColor(.grayColor)
                Text("\(smenu.isSet ? "단품" : "세트") \(smenu.quantity)개").font(.mainFont).foregroundColor(.grayColor)
                
                Spacer()
                HStack{
                    Spacer()
                    ZStack{
                        Image("ConfirmButtonL").resizable().scaledToFit().frame(width: 176)
                        Text("네").font(Font.mainFont).foregroundColor(Color.grayColor)
                    }.onTapGesture {
                        delAction(sm: $smenu, smList: $smList)
                        //update = true
                        showDelConfirmView = false
                    }
                    Spacer().frame(width:4)
//                    Button(action:{self.presentationMode.wrappedValue.dismiss()}, label:{
                    ZStack{
                        Image("ConfirmButtonR")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 176)
                        
                        Text("아니오").font(Font.mainFont).foregroundColor(.grayColor)
                    }.onTapGesture {
                        showDelConfirmView = false
                    }
//                    })
                    Spacer()
                }
            }
        }.frame(width: 356, height: 267, alignment: .center)
    //width: 356
        .background(Color.whiteColor)
        .cornerRadius(30)
        .clipped()
    }
}

struct OrderCancelConfirmView_Previews: PreviewProvider {
    @State static var smenu: SelectedMenu = SelectedMenu(menu: Menu(name: "아라비아따 리코타 치킨 버거", tag: ["치킨"], price: 6500, setPrice: 7800), quantity: 2, isSet: true)
    @State static var willShow = true
    @State static var update = false
    static var previews: some View {
        OrderCancelConfirmView(smenu: $smenu, showDelConfirmView: $willShow/*, update: $update*/)
    }
}
