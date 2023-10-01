//
//  ViewController.swift
//  homeWorkNumberSeven
//
//  Created by Иван Курганский on 10/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var avatarLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    var customize = Customize(name: "No name")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.13)
        avatarImageView?.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView?.layer.borderWidth = 1.5
        avatarImageView?.layer.borderColor = UIColor.purple.cgColor
        avatarImageView?.clipsToBounds = true
        
    }
    @IBAction func customizeButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "CustomizeViewController", bundle: nil).instantiateViewController(withIdentifier: "CustomizeViewController") as! CustomizeViewController
        let myNavigationController = UINavigationController(rootViewController: storyboard)
        customize.name = nameLabel.text ?? "No name"
        customize.avatarPicture = avatarImageView.image
        storyboard.delegateCustomizeViewController = self
        self.present(myNavigationController, animated: true, completion: nil)
    }
}

extension ViewController: CustomizeDelegate {
    func acceptChanged(_ customize: Customize) {
        nameLabel.text = customize.name
        guard let picture = customize.avatarPicture else { return }
        avatarLabel.isHidden = true
        avatarImageView.image = picture
    }
}
