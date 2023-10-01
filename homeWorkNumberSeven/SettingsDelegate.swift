//
//  File.swift
//  homeWorkNumberSeven
//
//  Created by Иван Курганский on 10/09/2023.
//

import UIKit

protocol CustomizeDelegate: AnyObject {
    var customize: Customize { get set }
    func acceptChanged(_ customize: Customize)
}

class Customize {
    var name: String
    var avatarPicture: UIImage? = nil
    init(name: String, avatarPicture: UIImage? = nil) {
        self.name = name
        self.avatarPicture = avatarPicture
    }
}
