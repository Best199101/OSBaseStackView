//
//  HYBaseCollectionViewDataSource.swift
//  Hey
//
//  Created by 张飞 on 2019/11/10.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import Foundation
import UIKit

class HYBaseCollectionViewDataSource: NSObject {
    
    public var dataSource:[NSObject] = []
    
}

extension HYBaseTableViewDataSource:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let row = indexPath.row
        let model = dataSource[row]
        
        let baseCell = HYBaseCollectionCellTool.getCurrentBaseCell(collectionView: collectionView, indexPath: indexPath, model: model)
        return baseCell
        
    }


}
