//
//  OrderModel.swift
//  IOS_SirenOrder
//
//  Created by 박성준 on 2021/07/31.
//

import Foundation

class ReceiptModel : NSObject{
    var orderId : String?
    var orderNum : String?
    var orderCount : Int?
    var orderPersonal : String?
    var orderDate : String?
    var storename : String?
    var cd : String?
    var userId : String?
    var price : Int?
    var img : String?
    var name : String?
    var address : String?
    var userNickname : String?
    var orderPersonalPrice : Int?
    
    override init() {
        
    }
    
    
    init(orderId : String, orderNum : String, orderCount : Int, orderPersonal : String, orderDate : String, storename : String, cd : String, price : Int, img : String, name : String, address : String, userNickname : String, orderPersonalPrice : Int){
        self.orderId=orderId
        self.orderNum=orderNum
        self.orderPersonal=orderPersonal
        self.orderCount=orderCount
        self.orderDate=orderDate
        self.storename=storename
        self.cd=cd
        self.price=price
        self.img=img
        self.name=name
        self.address=address
        self.userNickname=userNickname
        self.orderPersonalPrice=orderPersonalPrice
    }
}
