//
//  HYBaseCollectionCellTool.swift
//  Hey
//
//  Created by 张飞 on 2019/11/10.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import Foundation
import UIKit


class HYBaseCollectionCellTool: NSObject {

    public static func getCurrentBaseCell(collectionView:UICollectionView,indexPath:IndexPath,model:NSObject?) -> HYBaseCollectionCell {
        
        guard let cellIdentifierOption = model?.cellIdentifierOption else{
            
            return collectionView.dequeueReusableCell(withReuseIdentifier: HYBaseCollectionCell.cellIdentifier, for: indexPath) as! HYBaseCollectionCell
        }
        
        let baseCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierOption, for: indexPath) as! HYBaseCollectionCell
        
        if let modelInfo = model{
            baseCell.setCellData(modelInfo)
        }
        return baseCell
        
    }
    

}
