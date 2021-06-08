//
//  FinishGameView.swift
//  ConanSpell
//
//  Created by 白謹瑜 on 2021/6/7.
//

import SwiftUI

struct FinishGameView: View {
    @Binding var currentPage: pages
    var body: some View {
        ZStack{
            Image("Image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            HStack{
                Text("🥳恭喜～全部完成！🥳")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
            
        }
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now()+1.0){
                currentPage = pages.RecordEnterView
            }
            
            
        }
    }
}

struct FinishGameView_Previews: PreviewProvider {
    static var previews: some View {
        FinishGameView(currentPage: .constant(pages.GameoverView))
            .previewLayout(.fixed(width: 896, height: 414))

    }
}
