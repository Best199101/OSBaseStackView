//
//  HYCollectionBaseCell.swift
//  Hey
//
//  Created by 张飞 on 2019/8/1.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

class HYBaseCollectionCell: UICollectionViewCell {
    
    public static let HYCollectionBaseCellAction = "HYCollectionBaseCellAction"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadPrivateSubviews()
        layoutPrivateSubviews()
        
    }
   
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    
    }
    
    override func loadPrivateSubviews() {
        
//        self.backgroundColor = HY_Color_TableViewCell
        
    }
    
    override func layoutPrivateSubviews() {
        
    }

}

extension HYBaseCollectionCell: HYBaseCellProtocol{
   
    @objc func setCellData(_ model: HYBaseCollectionCell.U) {
        
    }

}

extension HYBaseCollectionCell{
    
    public static var cellIdentifier:String {
        
        get{
            return NSStringFromClass(self.classForCoder())
        }
    }
    
}
