//
//  GameRecordView.swift
//  ConanSpell
//
//  Created by 白謹瑜 on 2021/6/7.
//

import SwiftUI

struct GameRecordView: View {
    @ObservedObject var gameRecord = GameRecordData()
    @Binding var currentPage: pages
    var body: some View {
        HStack{
//            Spacer()
        VStack{
            
                Form{
                    HStack{
                        Text("排行榜")
                            .font(.headline)
                            .frame(width: 100)
                        Spacer()
                        Text("玩家")
                            .font(.headline)
                            .frame(width: 120)
                        Spacer()
                        Text("答對數")
                            .font(.headline)
                            .frame(width: 100)
                        Spacer()
                        Text("費時")
                            .font(.headline)
                            .frame(width: 100)
                        Spacer()
                        Text("日期")
                            .font(.headline)
                            .frame(width: 150)
                        Spacer()
                    }
                    ForEach(gameRecord.gameRecords.indices){ item in
                        
                        ListRowView(index: item, listRow: gameRecord.gameRecords[item])
                    }
                }
//                .listRowBackground(
//                    Image("排行榜")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 650, height: 550, alignment: .center)
//                        .opacity(0.7)
//                )
                
                    
                
            
            

            Spacer()
        }
        .padding([.top, .leading], 20.0)
            VStack{
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        currentPage = pages.WelcomeView
                    }
                    
                Spacer()
            }
        }
        .background(
            Image("Image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .onAppear(){
            
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().backgroundColor = .clear
        }
        
    }
}

struct GameRecordView_Previews: PreviewProvider {
    static var previews: some View {
        GameRecordView( currentPage: .constant(pages.GameRecordView))
            .previewLayout(.fixed(width: 896, height: 414))
    }
}
