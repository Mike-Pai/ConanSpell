//
//  RoleData.swift
//  ConanSpell
//
//  Created by 白謹瑜 on 2021/5/25.
//

import Foundation
import SwiftUI

struct Role:Identifiable {
    var id = UUID()
    var JPname:String
    var chname:String
}

struct SingleRole:Identifiable {
    var id = UUID()
    var vocabulary:String
}

var rolesSwordsman = [
    Role(JPname: "かまど ねずこ", chname: "彌豆子"),
    Role(JPname: "あがつま ぜんいつ", chname: "善逸"),
    Role(JPname: "かまど たんじろう", chname: "竈門炭治郎"),
    Role(JPname: "はしびら いのすけ", chname: "嘴平伊之助"),
    Role(JPname: "つゆり カナヲ", chname: "栗花落香奈乎"),
    Role(JPname: "しなずがわ げんや", chname: "不死川玄彌"),
    Role(JPname: "とみおか ぎゆう", chname: "富岡義勇"),
    Role(JPname: "こちょう しのぶ", chname: "胡蝶忍"),
    Role(JPname: "えどがわ コナン", chname: "柯南"),
    Role(JPname: "きぶつじ むざん", chname: "鬼舞辻無慘")
]


