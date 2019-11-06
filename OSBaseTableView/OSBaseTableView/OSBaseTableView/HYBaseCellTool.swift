//
//  HYBaseCellTool.swift
//  Hey
//
//  Created by 张飞 on 2019/9/2.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

class HYBaseCellTool: NSObject {

    public static func getCurrentBaseCell(tableView:UITableView,indexPath:IndexPath,model:NSObject) -> HYBaseCell {
        
        guard let cellIdentifierOption = model.cellIdentifierOption else{
            
            return HYBaseCell()
        }
        
        let baseCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierOption, for: indexPath) as! HYBaseCell
        baseCell.setCellData(model)
        
        return baseCell
        
    }
    
    public static func getCurrentBaseCellHeight(tableView:UITableView,indexPath:IndexPath,model:NSObject) -> CGFloat {
        
        guard let baseCellHeight = model.cellHeightOption else{
            return 0
        }
        return baseCellHeight
    
    }
    
    

}
