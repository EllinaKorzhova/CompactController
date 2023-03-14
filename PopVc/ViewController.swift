//
//  ViewController.swift
//  PopVc
//
//  Created by Эллина Коржова on 13.03.23.
//

import UIKit

class ViewController: UIViewController {
    var compactController = UIViewController()
    var menuArray = ["280pt", "150pt"]
    let image = UIImage(systemName: "multiply.circle.fill")
    
    @IBOutlet weak var presentButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tapButton(_ sender: UIButton) {
        showController()
    }
    
    func showController() {
        compactController.modalPresentationStyle = .popover
        compactController.view.backgroundColor = UIColor.white
        let popOverVC = compactController.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = self.presentButton
        popOverVC?.sourceRect = CGRect(x: self.presentButton.bounds.midX, y: self.presentButton.bounds.maxY, width: 0, height: 0)
        compactController.preferredContentSize = CGSize(width: 300, height: 300)
        self.present(compactController, animated: true, completion: nil)
        compactController.view.addSubview(segmentedControl)
        
        let button = UIButton(frame: CGRect(x: 250, y: 20, width: 50, height: 50))
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.gray
        button.addTarget(self, action: #selector(closeView(sender: )), for: .touchUpInside)
         compactController.view.addSubview(button)
           }
    
    @objc
    func closeView(sender: UIViewController){
        dismiss(animated: true)
    }
    
    var segmentedControl: UISegmentedControl {
        let segmentedControl = UISegmentedControl(items: menuArray)
        segmentedControl.backgroundColor = UIColor.systemIndigo
        segmentedControl.frame = CGRect(x: 75, y: 30, width: 150, height: 30)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(self.changeValue(sender: )), for: .valueChanged)
        return segmentedControl
    }
    
    @objc func changeValue(sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.9, animations: {
                self.compactController.preferredContentSize = CGSize(width: 300, height: 280)
            })} else {
                UIView.animate(withDuration: 0.9) {
                    self.compactController.preferredContentSize = CGSize(width: 300, height: 150)
                }
            }
        }
    }
    

extension ViewController: UIPopoverPresentationControllerDelegate{
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

