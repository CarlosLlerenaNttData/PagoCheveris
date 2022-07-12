//
//  PCFilters.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

import PagoCheverisUI

enum PCFilters: PCTabItem {
    case all
    
    var title: String {
        switch self {
        case .all:
            return "Todas"
        }
    }
}
