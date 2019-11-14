//
//  HYBaseStackVC.swift
//  Hey
//
//  Created by 张飞 on 2019/9/2.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

typealias indexCallBack = (_ index:UInt) -> Void
typealias enableMulScrollCallBack = () -> Bool

class HYBaseStackVC: HYBaseVC {
    
    public var dataSource:[HYBaseStackModel] = []
    public var subChildVCPool:[String:HYBaseVC] = [:]

    fileprivate lazy  var listCollectionView:HYBaseCollectionView = {
  
        let frameSize = self.view.bounds.size
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = frameSize
        flowlayout.minimumLineSpacing = 0
        flowlayout.minimumInteritemSpacing = 0
        flowlayout.scrollDirection = .horizontal
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionView = HYBaseCollectionView(
            frame: CGRect.zero,
            collectionViewLayout: flowlayout)
        collectionView.enableMulScrollCallBack = enableMulScrollCallBack
        collectionView.didScrollCallBack = { [weak self](scrollView) in
            
            guard let strongSelf = self,let callBack = strongSelf.indexCallBack else{return}
            
            if scrollView.isTracking || scrollView.isDragging || scrollView.isDecelerating{
                
                let index = (scrollView.contentOffset.x / scrollView.bounds.size.width) + 0.5
                
                let Ind = UInt(index)
                
                callBack(Ind)
    
            }
    
        }
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.register(HYBaseStackCell.self, forCellWithReuseIdentifier: HYBaseStackCell.cellIdentifier)
        
        return collectionView
        
    }()
    
    public var currentIndex:Int = 0{
        
        didSet{
            
            self.listCollectionView.setContentOffset(CGPoint(x: CGFloat(currentIndex) * HYScreenWidth, y: 0), animated: true)
            
        }
        
    }
    
    public var indexCallBack:indexCallBack?
    public var enableMulScrollCallBack:enableMulScrollCallBack?
    

    deinit {
        
        for child in self.children{
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func loadPrivateSubviews() {
        
  
        view.addSubview(listCollectionView)
    
    }
    
    override func layoutPrivateSubviews() {
        
        listCollectionView.mas_makeConstraints { (make) in
            
            make?.edges.mas_equalTo()(self.view)
        }
        
    }
    
    override func loadPrivateData() {
        
        listCollectionView.dataSourceArr = dataSource
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension HYBaseStackVC{
    
    public func reloadSubChildVC(subChild:[HYBaseStackModel]){
        
        dataSource.removeAll()

        for item in subChild{
         
            item.cellIdentifierOption = HYBaseStackCell.cellIdentifier
            
            if let stackSubTitle = item.subTitle,let stackSubVC = item.subVC {
                
                if let value = subChildVCPool[stackSubTitle]{
                    item.subVC = value
                    dataSource.append(item)
                    
                }else{
                    dataSource.append(item)
                    subChildVCPool[stackSubTitle] = stackSubVC
                    self.addChild(stackSubVC)
                }
                
            }
            
        }
        
    }
    
}



