//
//  ReminderViewController+Row.swift
//  Today
//
//  Created by Ayrmidon Hagraven on 5/24/24.
//

import UIKit

extension ReminderViewController {
    enum Row: Hashable {
        case date
        case note
        case time
        case title
        
        var imageName: String? {
            switch self {
            case .date: return "calendar.circle"
            case .note: return "square.and.rencil"
            case .time: return "clock"
            default: return nil
            }
        }
        
        var image: UIImage? {
            guard let imageName = imageName else { return nil }
            let configuration = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: configuration)
        }
        
        var textStyle: UIFont.TextStyle {
            switch self {
            case .title: return .headline
            default: return .subheadline
            }
        }
        
    }
}
