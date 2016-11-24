//
//  ContactsModel.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 17/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import CareKit

class ContactModel: Observer {
    static let sharedContactModel = ContactModel()
    private var leo: Leo!
    private var contactsArray: Array<OCKContact> = []
    private var path: String = ""
    
    private let NSCoding = NSCodingManager.sharedNSCodingManager
    
    private override init() {
        super.init()
        
        self.subject = Subject.sharedSubject
        self.subject.attach(self)
        
        self.leo = subject.getLeo()
        self.path = "\(leo.getId())/Contacts"
        
        self.getContacts()
    }
    
    override func update() {
        self.leo = subject.getLeo()
        self.path = "\(leo.getId())/Contacts"
    }
    
    func createConnectViewController() -> OCKConnectViewController {
        let viewController = OCKConnectViewController(contacts: self.contactsArray)
        
        viewController.title = "Contatos"
        viewController.tabBarItem = UITabBarItem(title: viewController.title, image: UIImage(named:"connect"), selectedImage: UIImage(named: "connect-filled"))
        
        return viewController
    }
    
    func saveContact(tipo: Int, nome: String, relacao: String, telefone: String, email: String) {
        let newContact = OCKContact(contactType: OCKContactType(rawValue: tipo)!,
                                    name: nome,
                                    relation: relacao,
                                    tintColor: UIColor.green,
                                    phoneNumber: CNPhoneNumber(stringValue: telefone),
                                    messageNumber: nil,
                                    emailAddress: email,
                                    monogram: nome.getInitials(),
                                    image: nil)
        
        contactsArray.append(newContact)
        
        if !NSCoding.saveAnyWithPath(path: path, object: contactsArray) {
            print("Erro ao salvar os contatos")
        }
    }
    
    private func getContacts() {
        let cont = NSCoding.getAnyWithPath(path: path)
        
        if cont == nil {
            contactsArray = []
            
        } else {
            contactsArray = cont as! Array<OCKContact>
        }
    }
}
