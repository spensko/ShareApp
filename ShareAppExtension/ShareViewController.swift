//
//  ShareViewController.swift
//  ShareAppExtension
//
//  Created by Mikhail Serov on 23.11.2019.
//  Copyright © 2019 serov. All rights reserved.
//

import UIKit
import Social
import CoreData

class ShareViewController: SLComposeServiceViewController {
    
    private var thumbnail: UIImage?
    private var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let extensionItem = extensionContext?.inputItems.first as? NSExtensionItem {
            
            let item = extensionItem.attachments?.first
            item?.loadPreviewImage(options: nil, completionHandler: { [weak self] (item, error) in
                if let image = item as? UIImage {
                    self?.thumbnail = image
                }
            })
            
            item?.loadItem(forTypeIdentifier: "public.url", options: nil, completionHandler: { [weak self] (item, error) in
                if let url = item as? URL {
                    self?.url = url
                    print(url)
                }
            })
        }
    }

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {

        let obj = ShareObj(context: CoreDataManager.shared.managedContext)
        obj.thumbnail = thumbnail?.jpegData(compressionQuality: 0.75)
        obj.name = url?.host
        obj.info = contentText
        obj.url = url?.absoluteString
        
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
        
        CoreDataManager.shared.saveContext()
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
