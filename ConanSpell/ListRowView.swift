//
//  ListRowView.swift
//  ConanSpell
//
//  Created by 白謹瑜 on 2021/6/7.
//

import SwiftUI

struct ListRowView: View {
    let index: Int
    let listRow: GameRecord
    var body: some View {
        HStack{
            
            Spacer()
            Text("\(index + 1)")
                .font(.body)
                .frame(width: 100)
            Spacer()
            Text(listRow.playerName)
                .font(.body)
                .frame(width: 120)
            Spacer()
            Text("\(listRow.correctNumber)")
                .font(.body)
                .frame(width: 100)
            Spacer()
            Text("\(listRow.playTime)")
                .font(.body)
                .frame(width: 100)
            Spacer()
            Group{
                HStack{
                    Text(listRow.DateTime,style: .date)
                        .font(.body)
                        .frame(width: 150)
                    Text(listRow.DateTime,style: .time)
                        .font(.body)
                        .frame(width: 150)
                }
                
                Spacer()
            }
           
        }
        
           
        
    }
}

