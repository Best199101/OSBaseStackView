//
//  HYBaseCollectionView.swift
//  Hey
//
//  Created by 张飞 on 2019/9/2.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

class HYBaseCollectionView: UICollectionView {
    
    public var count:Int32 = 20
    public var offset:Int32 = 0
    public var didScrollCallBack:didScrollCallBack?
    public var enableMulScrollCallBack:enableMulScrollCallBack?
    
    public var dataSourceArr: [NSObject] = [] {
        willSet {
            self.baseDataSource.dataSource = newValue
            self.baseDegelete.dataSource = newValue
        }
        
        didSet{
            self.reloadData()
        }
    }
    
    fileprivate lazy var baseDegelete:HYBaseCollectionViewDegelate = {
        
        let degelete = HYBaseCollectionViewDegelate()
        degelete.didScrollCallBack = { [weak self] scrollView in
            
            guard let strongSelf = self,let callBack = strongSelf.didScrollCallBack else{
                return
            }
            
            callBack(scrollView)
            
        }
        
        degelete.enableMulScrollCallBack = enableMulScrollCallBack
        
        return degelete
        
    }()
    
    fileprivate lazy var baseDataSource:HYBaseTableViewDataSource = {
        
        let dataSource = HYBaseTableViewDataSource()
        
        return dataSource
        
    }()
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        loadPrivateSubviews()
        layoutPrivateSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadPrivateSubviews() {
        
//        self.backgroundColor = HY_Color_TableViewCell
        self.delegate = baseDegelete
        self.dataSource = baseDataSource
        
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

}
