//
//  File.swift
//  homeWorkNumberSeven
//
//  Created by Иван Курганский on 10/09/2023.
//

import UIKit

class GenderViewController: UIViewController {
    
    weak var delegateGenderViewController: CustomizeDelegate?
    var customize = Customize(name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func maleButtonAction() {
        let storyboard = UIStoryboard(name: "MaleViewController", bundle: nil).instantiateViewController(withIdentifier: "MaleViewController") as! MaleViewController
        storyboard.delegateMaleViewController = self
        navigationController?.pushViewController(storyboard, animated: true)
    }
    
    @IBAction private func femaleButtonAction() {
        let storyboard = UIStoryboard(name: "FemaleViewController", bundle: nil).instantiateViewController(withIdentifier: "FemaleViewController") as! FemaleViewController
        storyboard.delegateFemaleViewController = self
        navigationController?.pushViewController(storyboard, animated: true)
    }
}

extension GenderViewController: CustomizeDelegate {
    func acceptChanged(_ customize: Customize) {
        delegateGenderViewController?.acceptChanged(customize)
    }
}
