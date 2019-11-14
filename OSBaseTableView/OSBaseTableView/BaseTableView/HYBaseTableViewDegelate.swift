//
//  HYBaseTableDegelate.swift
//  Hey
//
//  Created by 张飞 on 2019/9/2.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

class HYBaseTableViewDegelate: NSObject {
    
    public var dataSource:[NSObject] = []
    public var didScrollCallBack:didScrollCallBack?
    public var enableMulScrollCallBack:enableMulScrollCallBack?

}

extension HYBaseTableViewDegelate:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let row = indexPath.row
        let model = dataSource[row]
        
        let baseCellHeight = HYBaseCellTool.getCurrentBaseCellHeight(tableView: tableView, indexPath: indexPath, model: model)
        
        return baseCellHeight
    }
    
}


extension HYBaseTableViewDegelate:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
  
        if let callBack = didScrollCallBack{
            callBack(scrollView)
        }
        
    }
    
}

extension HYBaseTableViewDegelate:UIGestureRecognizerDelegate{

    // 多手势
       func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{

           guard let callBack = enableMulScrollCallBack else{
               
               return false
           }
           return callBack()
       
       }
    
    
}
