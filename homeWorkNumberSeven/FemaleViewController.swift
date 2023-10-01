//
//  File.swift
//  homeWorkNumberSeven
//
//  Created by Иван Курганский on 10/09/2023.
//

import UIKit

class FemaleViewController: UIViewController {
    
    @IBOutlet weak var foxButton: UIButton!
    @IBOutlet weak var mirrorButton: UIButton!
    @IBOutlet weak var queenButton: UIButton!
    @IBOutlet weak var candyButton: UIButton!
    
    weak var delegateFemaleViewController: CustomizeDelegate?
    var customize = Customize(name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foxButton.tag = 0
        mirrorButton.tag = 1
        queenButton.tag = 2
        candyButton.tag = 3
    }
    
    @IBAction private func nameFemaleButtonAction (_ sender: UIButton) {
        switch sender.tag {
        case 0:
            customize.name = "Fox"
            delegateFemaleViewController?.acceptChanged(customize)
            showAvatarScreen()
        case 1:
            customize.name = "Mirror"
            delegateFemaleViewController?.acceptChanged(customize)
            showAvatarScreen()
        case 2:
            customize.name = "Queen"
            delegateFemaleViewController?.acceptChanged(customize)
            showAvatarScreen()
        case 3:
            customize.name = "Candy"
            delegateFemaleViewController?.acceptChanged(customize)
            showAvatarScreen()
        default:
            return
        }
    }
    
    private func showAvatarScreen() {
        let storyboard = UIStoryboard(name: "AvatarViewController", bundle: nil).instantiateViewController(withIdentifier: "AvatarViewController") as! AvatarViewController
        storyboard.delegateAvatarViewController = self
        navigationController?.pushViewController(storyboard, animated: true)
    }
}

extension FemaleViewController: CustomizeDelegate {
    func acceptChanged(_ customize: Customize) {
        delegateFemaleViewController?.acceptChanged(customize)
    }
}
