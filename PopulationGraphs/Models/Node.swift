//
//  Node.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 2/18/24.
//

import SwiftData
import Foundation

@Model class Node {
    @Attribute(.unique) var name: String
    let size: Float
    let group: Int
    var latitude: Double
    var longitude: Double
    
    init(name: String, size: Float = 0.005, group: Int, latitude: Double, longitude: Double) {
        self.name = name
        self.size = size
        self.group = group
        self.longitude = longitude
        self.latitude = latitude
    }
    
}




extension Node {
    
    static var LophoNodes: [Node] {
        var ret = [Node]()
        ret.append( Node( name: "BaC", size: 12.15881, group: 0, latitude: 26.59, longitude: -111.79) )
        ret.append( Node( name: "Ctv", size: 3.880886, group: 0, latitude: 29.73, longitude: -114.72) )
        ret.append( Node( name: "LaV", size: 3.5337565, group: 0, latitude: 24.04, longitude: -109.99) )
        ret.append( Node( name: "Lig", size: 4.731355, group: 0, latitude: 25.73, longitude: -111.27) )
        ret.append( Node( name: "PtC", size: 4.684652, group: 0, latitude: 24.19, longitude: -111.15) )
        ret.append( Node( name: "PtP", size: 10.925375, group: 0, latitude: 29.03, longitude: -113.9) )
        ret.append( Node( name: "SLG", size: 5.955645, group: 0, latitude: 29.59, longitude: -114.4) )
        ret.append( Node( name: "SnE", size: 11.82822, group: 0, latitude: 24.45, longitude: -110.7) )
        ret.append( Node( name: "SnF", size: 6.325655, group: 0, latitude: 30.76, longitude: -114.73) )
        ret.append( Node( name: "SnI", size: 5.466695, group: 0, latitude: 27.29, longitude: -113.02) )
        ret.append( Node( name: "StR", size: 6.859545, group: 0, latitude: 24.91, longitude: -111.62) )
        ret.append( Node( name: "TsS", size: 5.29057, group: 0, latitude: 23.58, longitude: -110.34) )
        ret.append( Node( name: "CP", size: 7.870725, group: 1, latitude: 27.95, longitude: -110.66) )
        ret.append( Node( name: "LF", size: 8.472215, group: 1, latitude: 30.68, longitude: -112.27) )
        ret.append( Node( name: "PL", size: 6.692795, group: 1, latitude: 30.39, longitude: -112.58) )
        ret.append( Node( name: "SenBas", size: 9.116705, group: 1, latitude: 31.95, longitude: -112.87) )
        ret.append( Node( name: "Seri", size: 2.5, group: 1, latitude: 28.88, longitude: -111.96) )
        ret.append( Node( name: "SG", size: 11.02753, group: 1, latitude: 29.4, longitude: -112.05) )
        ret.append( Node( name: "SI", size: 11.52145, group: 1, latitude: 29.75, longitude: -112.5) )
        ret.append( Node( name: "SN", size: 8.325785, group: 1, latitude: 28.82, longitude: -111.8) )
        ret.append( Node( name: "TS", size: 16.001165, group: 1, latitude: 28.41, longitude: -111.37) )
        return ret
    }
    
}


