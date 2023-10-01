//
//  File.swift
//  homeWorkNumberSeven
//
//  Created by Иван Курганский on 10/09/2023.
//

import UIKit

class CustomizeViewController: UIViewController {
    
    @IBOutlet private weak var avatarLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    weak var delegateCustomizeViewController: CustomizeDelegate?
    var customize = Customize(name: "")
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let myCustomize = delegateCustomizeViewController?.customize else { return }
        customize = myCustomize
        
        if customize.avatarPicture != nil {
            avatarLabel.isHidden = true
        }
        
        avatarImageView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.13)
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.layer.borderWidth = 1.5
        avatarImageView.layer.borderColor = UIColor.purple.cgColor
        avatarImageView.clipsToBounds = true
    }

    @IBAction private func saveButtonAction() {
        guard let name = nameLabel.text else { return }
        customize.name = name
        guard let picture = avatarImageView.image else { return }
        customize.avatarPicture = picture
        delegateCustomizeViewController?.acceptChanged(customize)
        dismiss(animated: true)
    }
    
    @IBAction private func editButtonAction() {
        let storyboard = UIStoryboard(name: "GenderViewController", bundle: nil).instantiateViewController(withIdentifier: "GenderViewController") as! GenderViewController
        storyboard.delegateGenderViewController = self
        navigationController?.pushViewController(storyboard, animated: true)
    }
    
    @IBAction private func cancelButtonAction() {
       dismiss(animated: true)
    }
}

extension CustomizeViewController: CustomizeDelegate {
    func acceptChanged(_ customize: Customize) {
        nameLabel.text = customize.name
        guard let picture = customize.avatarPicture else { return }
        avatarLabel.isHidden = true
        avatarImageView.image = picture
    }
}
