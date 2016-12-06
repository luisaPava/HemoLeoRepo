//
//  ConnectViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 17/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class ConnectViewController: UINavigationController {
    private var viewController: UIViewController? = nil
    private var contactModel = ContactModel.sharedContactModel

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewController = contactModel.createConnectViewController()
        viewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Novo", style: .done, target: self, action: #selector(pushAddContactController))
        viewController?.navigationItem.rightBarButtonItem?.tintColor = UIColor(netHex: 0x2ECC71)
        
        if self.viewControllers.isEmpty {
            self.pushViewController(viewController!, animated: false)
            
        } else {
            self.setViewControllers([viewController!], animated: false)
            
        }
    }
    
    func pushAddContactController() {
        self.performSegue(withIdentifier: "contactToAdd", sender: self)
    }
}
