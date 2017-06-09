//
//  RulerShapeView.swift
//  WHRuler
//
//  Created by Walden on 17/4/17.
//  Copyright © 2017年 Walden. All rights reserved.
//

import UIKit

class RulerView: UIView {
    
    /// 获取shapelayer
    var shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        
        return shapeLayer
    }()

    
    /// 尺子的长度
    var rulerLength: Double = 300
    /// 刻度的宽度, 刻度之间的间隔
    var dialBlank: Double = 10.0
    /// 刻度分割最小的高度
    var dialMinHeight: Double = 8
    /// 刻度分割最大的高度
    var dialMaxHeight: Double = 13
    /// 刻度的颜色
    var dialColor: UIColor = UIColor.gray
    /// 文字颜色
    var textColor: UIColor = UIColor.lightGray
    /// 刻度尺显示的刻度范围
    var dialRange: Range = Range(uncheckedBounds: (0, 0))
    /// 每个刻度表示的宽度
    var dialSpan: Int = 100
    
    
    // 配置
    func displayRuler() {
        
        layer.addSublayer(shapeLayer)
        
        //计算尺子长度
        rulerLength = Double((dialRange.upperBound - dialRange.lowerBound) / dialSpan) * dialBlank
        
        let bzier = UIBezierPath()
        
        var x = 0.0
        let bottomY = Double(frame.size.height-1)
        let space = dialBlank
        let minHeight = Double(frame.size.height) - dialMinHeight
        let maxHeight = Double(frame.size.height) - dialMaxHeight
        
        
        let scope = (dialRange.lowerBound / dialSpan)...(dialRange.upperBound / dialSpan)
        for index in scope {
            
            var y: Double = minHeight
            if index % 10 == 0 {
                y = maxHeight
                let graduate = Double(index * dialSpan)
                addNumLabel(centerX: x, graduate: graduate)
            }
            bzier.move(to: CGPoint(x: x, y: bottomY))
            bzier.addLine(to: CGPoint(x: x, y: y))
            
            x += space
            
        }
        
        // 底部的横线
        bzier.move(to: CGPoint(x: 0, y: bottomY))
        bzier.addLine(to: CGPoint(x: rulerLength, y: bottomY))
        
        shapeLayer.path = bzier.cgPath
        shapeLayer.strokeColor = dialColor.cgColor
        shapeLayer.lineWidth = 0.3
    }
    
    /// 添加一个数字label
    func addNumLabel(centerX: Double, graduate: Double) {
        
        let label = UILabel()
        addSubview(label)
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: 9)
        label.text = String(format: "%.0lf", graduate)
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 0, width: 50, height: 12)
        label.center = CGPoint(x: centerX, y: -7)
    }
    

    /// 根据给定的offset, 计算出据此OffSet最近的刻度offset
    func closestOffset(offset: CGPoint) -> CGPoint {
        
        let targetGraduated = lround(Double(offset.x) / dialBlank)
        
        return CGPoint(x: Double(targetGraduated) * dialBlank, y: 0.0)
    }
    
    /// 给个指定的contentOffset, 计算出具体的数字
    func calcCurrentFigure(offset: CGPoint) -> Int {
        
        let currentFigure = Int(Double(offset.x) / dialBlank) * dialSpan + dialRange.lowerBound
        return currentFigure
    }
    
    

}







