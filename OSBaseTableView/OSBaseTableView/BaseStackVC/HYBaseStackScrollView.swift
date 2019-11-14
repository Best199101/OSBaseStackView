//
//  HYBaseStackScrollView.swift
//  Hey
//
//  Created by 张飞 on 2019/11/13.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

class HYBaseStackScrollView: UIScrollView,UIGestureRecognizerDelegate{
    
    public var enableMulScrollCallBack:enableMulScrollCallBack?
    
    // 多手势
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{
        
        guard let callBack = enableMulScrollCallBack else{
            
            return false
        }
        return callBack()
 
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
