//
//  File.swift
//  homeWorkNumberSeven
//
//  Created by Иван Курганский on 10/09/2023.
//

import UIKit

class AvatarViewController: UIViewController {
    
    @IBOutlet weak var antButton: UIButton!
    @IBOutlet weak var personButton: UIButton!
    @IBOutlet weak var crownButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    
    weak var delegateAvatarViewController: CustomizeDelegate?
    var customize = Customize(name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        antButton.tag = 0
        personButton.tag = 1
        crownButton.tag = 2
        starButton.tag = 3
        
        guard let myCustomize = delegateAvatarViewController?.customize else { return }
        customize = myCustomize
    }
    
    @IBAction private func avatarButtonAction(_ sender: UIButton) {
        customize.avatarPicture = sender.imageView?.image
        delegateAvatarViewController?.acceptChanged(customize)
        navigationController?.popToRootViewController(animated: true)
    }
}
//    
//   
//
//}
//import UIKit
//
//class AvatarViewController: UIViewController {
//
//    @IBOutlet weak var antButton: UIButton!
//    @IBOutlet weak var personButton: UIButton!
//    @IBOutlet weak var crownButton: UIButton!
//    @IBOutlet weak var starButton: UIButton!
//
//    weak var delegateAvatarViewController: CustomizeDelegate?
//    var customize = Customize(name: "")
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        antButton.tag = 0
//        personButton.tag = 1
//        crownButton.tag = 2
//        starButton.tag = 3
//
//    }
//
//    @IBAction private func avatarButtonAction(_ sender: UIButton) {
//        switch sender.tag {
//        case 0:
//            customize.avatarPicture = sender.currentImage
//            delegateAvatarViewController?.acceptChanged(customize)
//            navigationController?.popToRootViewController(animated: true)
//        case 1:
//            customize.avatarPicture = sender.currentImage
//            delegateAvatarViewController?.acceptChanged(customize)
//            navigationController?.popToRootViewController(animated: true)
//        case 2:
//            customize.avatarPicture = sender.currentImage
//            delegateAvatarViewController?.acceptChanged(customize)
//            navigationController?.popToRootViewController(animated: true)
//        case 3:
//            customize.avatarPicture = sender.currentImage
//            delegateAvatarViewController?.acceptChanged(customize)
//            navigationController?.popToRootViewController(animated: true)
//        default:
//            return
//        }
//    }
//
//
//}
//extension AvatarViewController: CustomizeDelegate {
//    func acceptChanged(_ customize: Customize) {
//        delegateAvatarViewController?.acceptChanged(customize)
//    }
//}
