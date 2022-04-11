//
//  OrderView.swift
//  MC1
//
//  Created by Hyorim Nam on 2022/04/07.
//

import SwiftUI

struct OrderView: View {
    @Binding var smenu: SelectedMenu
    @State private var alertDel = false

//    var w: CGFloat = 343
    let rw: CGFloat = 80
    let h: CGFloat = 92.96
    let rad: CGFloat = 25
    //줄일 수 있나?

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30).foregroundColor(Color.whiteColor).frame(minWidth: 343, idealWidth: 343, maxWidth: .infinity, minHeight: 92.96, idealHeight: 92.96, maxHeight: 92.96, alignment: .center)
            HStack(spacing: 5.0){
                Spacer().frame(width: 10)
                Image(smenu.menu.name).resizable().scaledToFit().frame(height: 64, alignment: .leading)
                // MARK: GeometryReader 사용해서 위치 정해보기
                // MARK: 글씨 위치, 양, 크기 문제
                VStack(alignment: .leading){
                    Spacer()
                    Text(smenu.menu.name).font(.system(size: 30, weight: .black)).foregroundColor(Color.grayColor).frame(minWidth: 164, alignment: .leading)
                    Spacer()
                    Text(setIfSet(sm:smenu)+"\(smenu.quantity)개 \(smenu.isSet ?  smenu.quantity * smenu.menu.setPrice : smenu.quantity * smenu.menu.price)원").font(Font.mainFont).foregroundColor(Color.grayColor).multilineTextAlignment(.leading).frame(minWidth: 164, alignment: .leading)
                }.frame(minWidth: 150, idealWidth: 150, maxWidth: 164, minHeight: 25, idealHeight: 27, maxHeight: 30, alignment: .leading)
                Spacer()
                Button(action: {alertDel = true}, label: {
                    ZStack{
                        Image("TrashButton")/*.resizable().scaledToFit().frame(width: 100, height: h, alignment: .trailing).padding(.trailing)*/
                        //popup, delete
            
                        Text("취소").font(Font.mainFont.bold()).foregroundColor(Color.whiteColor)
                    }
                })//.alert(Text("- 메뉴를 취소하시겠습니까?"), isPresented: alertDel, actions: deleteAnOrder, message: <#T##(T) -> M#>){Button("취소")}
            }
        }//.frame(width: <#T##CGFloat?#>, height: <#T##CGFloat?#>, alignment: <#T##Alignment#>)
    }
}

func setIfSet(sm: SelectedMenu)->String{
    return sm.isSet ? "세트" : "단품"
    /*if sm.isSet{ return "세트"}
    else {return "단품"}*/
}

func deleteAnOrder(){
    
}

struct OrderView_Previews: PreviewProvider {
    @State static var smenu: SelectedMenu = SelectedMenu(menu: Menu(name: "더블 빅맥", tag: ["소고기"], price: 7000, setPrice: 5000), quantity: 2, isSet: true)

    static var previews: some View {
        OrderView(smenu: $smenu)
    }
}
