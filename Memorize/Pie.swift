//
//  Pie.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 12/4/21.
//

import SwiftUI

struct Pie:Shape{
    var startAngle:Angle
    var endAngle:Angle
    var clockwise:Bool
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x:rect.midX, y:rect.midY)
        let radius = min(rect.height, rect.width)/2
        var path = Path()
       
        let startPoint = CGPoint(x: center.x + (radius*CGFloat(cos(startAngle.radians))),
                                 y: center.y + (radius*CGFloat(sin(startAngle.radians))) )
        
        path.move(to: center)
        path.addLine(to: startPoint)
       path.addArc(center: center, radius: radius , startAngle: startAngle, endAngle: endAngle, clockwise: !clockwise)
        path.addLine(to: center)
        return path
    }
    
    
}
