//
//  FinishView.swift
//  MC1
//
//  Created by 이성수 on 2022/04/11.
//

import SwiftUI

struct FinishView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("주문이 완료되었습니다!")
                    .font(.system(size: 32, weight: .black, design: .rounded))
                    .padding(.bottom, 13.0)
                //Spacer()
                Text("카운터에서 주문하신 메뉴를\n찾아가주세요")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.leading)
                Spacer()
                Image("FinishImage")
                    .resizable()
                    . frame(width: 271, height: 252)
                Spacer()
                NavigationLink(destination: StartView()){
                    Image("FinishButton")
                        .resizable()
                        .frame(width: 344, height: 78)
                
                    
                }
                
            }
        }
        
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
            .previewInterfaceOrientation(.portrait)
    }
}
