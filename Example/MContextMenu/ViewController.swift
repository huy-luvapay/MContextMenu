//
//  ViewController.swift
//  MContextMenu
//
//  Created by huy-luvapay on 12/04/2020.
//  Copyright (c) 2020 huy-luvapay. All rights reserved.
//

import UIKit
import MContextMenu

class ViewController: UIViewController {
    
    @IBOutlet var buttonShow: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.buttonShow.addTarget(self, action: #selector(self.showPressed), for: UIControlEvents.touchUpInside)
        
        let favoriteAction = ContextMenuAction(title: "Looooooooooooong title Looooooooooooong title Looooooooooooong title Looooooooooooong title",
                                               image: UIImage(named: "heart.fill"),
                                               action: { _ in print("favorite") })
        let shareAction = ContextMenuAction(title: "Share",
                                            image: UIImage(named: "square.and.arrow.up.fill"),
                                            action: { _ in print("share") })
        let deleteAction = ContextMenuAction(title: "Delete",
                                             image: UIImage(named: "trash.fill"),
                                             tintColor: UIColor.red,
                                             action: { _ in print("delete") })
        let actions = [favoriteAction, shareAction, deleteAction]
        let contextMenu = ContextMenu(
            title: "Actions",
            actions: actions,
            delegate: self)
        /*
         contextMenuButtons
         .forEach {
         $0.addContextMenu(contextMenu, for: .tap(numberOfTaps: 1), .longPress(duration: 0.3))
         }
         */
        self.buttonShow.addContextMenu(contextMenu)
        /*
        self.buttonShow.showContextMenu {
            
        }
        */
        self.buttonShow.backgroundColor = UIColor.white
        //self.buttonShow.addContextMenu(contextMenu, for: .tap(numberOfTaps: 1), .longPress(duration: 0.3))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func showPressed() {
        
        self.buttonShow.showContextMenu {
            print("showContextMenu")
        }
        
    }

}


extension ViewController: ContextMenuDelegate {

    func contextMenuWillAppear(_ contextMenu: ContextMenu) {
        print("context menu will appear")
    }
    
    func contextMenuDidAppear(_ contextMenu: ContextMenu) {
        print("context menu did appear")
    }
}
