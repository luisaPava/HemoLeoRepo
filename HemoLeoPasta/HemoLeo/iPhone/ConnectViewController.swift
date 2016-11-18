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
        viewController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Novo", style: .done, target: self, action: #selector(pushAddContactController))
        
        self.pushViewController(viewController!, animated: false)
    }
    
    func pushAddContactController() {
        self.performSegue(withIdentifier: "contactToAdd", sender: self)
    }
}
