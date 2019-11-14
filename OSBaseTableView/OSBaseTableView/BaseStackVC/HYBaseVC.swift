//
//  HYBaseVC.swift
//  Hey
//
//  Created by 张飞 on 2019/8/27.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit


let HYScreenWidth = UIScreen.main.bounds.size.width
let HYScreenHeight = UIScreen.main.bounds.size.height

class HYBaseVC: UIViewController {
    
    @objc public var navOffset:CGFloat = 0{
        
        didSet{
            
        }
        
    }
    
    override func loadView() {
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: navOffset, width: HYScreenWidth, height: HYScreenHeight - navOffset)
        view.backgroundColor = .black
        self.view = view
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPrivateSubviews()
        layoutPrivateSubviews()
        loadPrivateData()
        // Do any additional setup after loading the view.
    }
    
    override func loadPrivateSubviews() {
        
    }
    
    override func layoutPrivateSubviews() {
        
    }
    
    override func loadPrivateData() {
        
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
