//
//  HYBaseCollectionViewDegelate.swift
//  Hey
//
//  Created by 张飞 on 2019/11/10.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import Foundation
import UIKit

class HYBaseCollectionViewDegelate: NSObject {
    
    public var dataSource:[NSObject] = []
    public var didScrollCallBack:didScrollCallBack?
    public var enableMulScrollCallBack:enableMulScrollCallBack?

}

extension HYBaseCollectionViewDegelate:UICollectionViewDelegate{
    

}

extension HYBaseCollectionViewDegelate:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
  
        if let callBack = didScrollCallBack{
            callBack(scrollView)
        }
        
    }
    
}

extension HYBaseCollectionViewDegelate:UIGestureRecognizerDelegate{

    // 多手势
       func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{

           guard let callBack = enableMulScrollCallBack else{
               
               return false
           }
           return callBack()
       
       }
    
    
}
