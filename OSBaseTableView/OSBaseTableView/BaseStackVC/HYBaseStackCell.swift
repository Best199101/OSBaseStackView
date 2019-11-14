//
//  HYBaseStackCell.swift
//  Hey
//
//  Created by 张飞 on 2019/11/13.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit
import Masonry

class HYBaseStackCell: HYBaseCollectionCell {
 
    override func loadPrivateSubviews() {
        super.loadPrivateSubviews()
        
        
    }
    
    override func layoutPrivateSubviews() {
        super.layoutPrivateSubviews()
        
    }
    
    override func setCellData(_ model: HYBaseStackCell.U) {
    
        if let modelInfo = model as? HYBaseStackModel{
            updateStackCell(model: modelInfo)
        }
    }
    
    func updateStackCell(model:HYBaseStackModel){
        
        self.contentView.subviews.forEach {$0.removeFromSuperview()}
        
        let subView = model.subVC?.view
        guard let subview = subView else{return}
        
        self.contentView.addSubview(subview)
        subview.mas_makeConstraints({ (make) in

            make?.edges.mas_equalTo()(self.contentView)
        })
        
        
    }
    
    
    
    
    
}
