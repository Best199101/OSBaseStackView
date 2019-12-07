//
//  HYBaseTableView.swift
//  Hey
//
//  Created by 张飞 on 2019/9/2.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

typealias didScrollCallBack = (_ scrollView:UIScrollView) -> Void
typealias loadDataCompeleteCallBack = () -> Void

typealias dataSourceCountCallBack = (_ section:Int) -> Int
typealias dataSourceModelCallBack = (_ indexPath:IndexPath) -> NSObject?


class HYBaseTableView: UITableView {
    
    public var count:Int32 = 20
    public var offset:Int32 = 0
    public var didScrollCallBack:didScrollCallBack?
    public var enableMulScrollCallBack:enableMulScrollCallBack?

    public var dataSourceArr: [NSObject] = [] {
       
        didSet{
            self.reloadData()
        }
    }
    

    fileprivate lazy var baseDegelete:HYBaseTableViewDegelate = {
        
        let degelete = HYBaseTableViewDegelate()
        degelete.didScrollCallBack = { [weak self] scrollView in
            
            guard let strongSelf = self,let callBack = strongSelf.didScrollCallBack else{
                return
            }

            callBack(scrollView)
            
        }
        
        degelete.dataSourceModel = {[weak self](indexpath) in
            
            guard let strongSelf = self else{
                return nil}
            
            if indexpath.row < strongSelf.dataSourceArr.count{
                return strongSelf.dataSourceArr[indexpath.row]
            }else{
                return nil
            }
            
        }
 
        return degelete
    
    }()
    
    fileprivate lazy var baseDataSource:HYBaseTableViewDataSource = {
        
        let dataSource = HYBaseTableViewDataSource()
    
        dataSource.dataSourceModel = {[weak self] (indexpath) in
            
            guard let strongSelf = self else{
                return nil}
            
            if indexpath.row < strongSelf.dataSourceArr.count{
                return strongSelf.dataSourceArr[indexpath.row]
            }else{
                return nil
            }
            
        }
        
        dataSource.dataSourceCount = {[weak self] (section)in
            
            guard let strongSelf = self else{
                return 0}
            
            return strongSelf.dataSourceArr.count
            
        }
        
        
        
        return dataSource
        
    }()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        loadPrivateSubviews()
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadPrivateSubviews() {
//        self.backgroundColor = HY_Color_TableViewCell
        self.separatorStyle = .none
        self.sectionHeaderHeight = 0
        self.sectionFooterHeight = 0
        self.estimatedRowHeight = 0
        
        self.delegate = baseDegelete
        self.dataSource = baseDataSource
        
    }
 
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


extension HYBaseTableView:UIGestureRecognizerDelegate{

    // 多手势
       func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{

           guard let callBack = enableMulScrollCallBack else{
               
               return false
           }
           return callBack()
       
       }
    
    
}
