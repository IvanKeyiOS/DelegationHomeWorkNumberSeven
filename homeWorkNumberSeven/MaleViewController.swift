//
//  File.swift
//  homeWorkNumberSeven
//
//  Created by Иван Курганский on 10/09/2023.
//

import UIKit

class MaleViewController: UIViewController {
    
    @IBOutlet weak var frogButton: UIButton!
    @IBOutlet weak var hammerButton: UIButton!
    @IBOutlet weak var kingButton: UIButton!
    @IBOutlet weak var gunButton: UIButton!
    
    weak var delegateMaleViewController: CustomizeDelegate?
    var customize = Customize(name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frogButton.tag = 0
        hammerButton.tag = 1
        kingButton.tag = 2
        gunButton.tag = 3
        
    }
    
    @IBAction private func nameMaleButtonAction (_ sender: UIButton) {
        switch sender.tag {
        case 0:
            customize.name = "Frog"
            delegateMaleViewController?.acceptChanged(customize)
            showAvatarScreen()
        case 1:
            customize.name = "Hammer"
            delegateMaleViewController?.acceptChanged(customize)
            showAvatarScreen()
        case 2:
            customize.name = "King"
            delegateMaleViewController?.acceptChanged(customize)
            showAvatarScreen()
        case 3:
            customize.name = "Gun"
            delegateMaleViewController?.acceptChanged(customize)
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

extension MaleViewController: CustomizeDelegate {
    func acceptChanged(_ customize: Customize) {
        delegateMaleViewController?.acceptChanged(customize)
    }
}
