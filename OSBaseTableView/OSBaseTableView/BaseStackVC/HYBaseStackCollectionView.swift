//
//  HYBaseStackCollectionView.swift
//  Hey
//
//  Created by 张飞 on 2019/11/12.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

class HYBaseStackCollectionView: UICollectionView,UIGestureRecognizerDelegate{
    
    public var enableMulScrollCallBack:enableMulScrollCallBack?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        loadPrivateSubviews()
        layoutPrivateSubviews()
        
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadPrivateSubviews() {
        
        self.backgroundColor = UIColor.clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.isPagingEnabled = true
        self.bounces = false
      
        self.register(HYBaseStackCell.self, forCellWithReuseIdentifier: HYBaseStackCell.cellIdentifier)
        
        
    }
    
    override func layoutPrivateSubviews() {
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    // 多手势
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{

        guard let callBack = enableMulScrollCallBack else{
            
            return false
        }
        return callBack()
    
    }

}

