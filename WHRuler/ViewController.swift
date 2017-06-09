//
//  ViewController.swift
//  WHRuler
//
//  Created by Walden on 17/4/17.
//  Copyright © 2017年 Walden. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SweetRulerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        
        configUI()
    }
    
    // delegate
    func configUI() {
        
        let sweetRuler = SweetRuler(frame: CGRect(x: 10, y: 100, width: 300, height: 40))
        view.addSubview(sweetRuler)
        sweetRuler.figureRange = Range(uncheckedBounds: (500, 30000))
        sweetRuler.setSelectFigure(figure: 18000)
        sweetRuler.delegate = self
    }
    
    ///刻度尺代理方法
    func sweetRuler(ruler: SweetRuler, figure: Int){
        
        print("\t\tfigure: \(figure)")
    }

    


}

