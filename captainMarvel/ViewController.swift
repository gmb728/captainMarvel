//
//  ViewController.swift
//  captainMarvelCATransaction
//
//  Created by Chang Sophia on 3/14/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
  
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var starView: UIView!
    @IBOutlet weak var gradientSlider: UISlider!
    
    @IBOutlet weak var gradationImageView: UIImageView!
    
    //星星座標
    var starPointA = CGPoint(x: 200, y: 0)
    var starPointB = CGPoint(x: 107, y: 160)
    var starPointC = CGPoint(x: 25, y: 143)
    var starPointD = CGPoint(x: 43, y: 235)
    var starPointE = CGPoint(x: -56, y: 286)
    var starPointF = CGPoint(x: 52, y: 342)
    var starPointG = CGPoint(x: 25, y: 434)
    var starPointH = CGPoint(x: 115, y: 416)
    var starPointI = CGPoint(x: 200, y: 513)
  
    func gradientChanged(){
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in:0...1)
        let alpha = Double.random(in:0...1)
        
        starView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradationImageView.bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.magenta.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x:1, y: 1)
        gradientLayer.locations = [0, NSNumber(value: gradientSlider.value)]
        gradationImageView.layer.addSublayer(gradientLayer)
    }
    
    @IBAction func changeColorSliderActed(_
        sender: Any) {
        
        gradientChanged()
    }
    @IBAction func starButttonPressed(_ sender: Any) {
       
        var starPoints: [CGPoint] = [starPointA, starPointB, starPointC, starPointD, starPointE, starPointF, starPointG, starPointH, starPointI]
        
        
       gradientChanged()
        
        
       //畫一半星星
        let starPath = UIBezierPath()
        let starPoint = starPoints[0]
        starPath.move(to: starPoint)
       
        // 產生另一半的星星
        for i in 0..<starPoints.count {
            starPath.addLine(to:starPoints[i])
        
            for j in 0..<starPoints.count {
                starPoints[j].x = (200 - starPoints[j].x) + 200
                    starPath.addLine(to: starPoints[j])
            }
            starPath.close()
            
            let starLayer = CAShapeLayer()
            starLayer.path = starPath.cgPath
            starView.layer.mask = starLayer
            
            starView.addSubview(bgImageView)
        }
        
        
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

