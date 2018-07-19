//
//  DropDownView.swift
//  softevolTask
//
//  Created by Serhii on 7/18/18.
//  Copyright © 2018 Serhii. All rights reserved.
//

import UIKit


class DropDownView: UITableView, UITableViewDelegate, UITableViewDataSource {

    var dropDownOptions = ["print", "forvard", "add bookmarks"]
    var tableView: UITableView!

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//
//        tableView = UITableView.init(frame: self.frame, style: UITableViewStyle.grouped)
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        self.backgroundColor = UIColor.red
//
//        //tableView.translatesAutoresizingMaskIntoConstraints = false
//
//        self.addSubview(tableView)
//
//
//
////        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
////        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
////        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
////        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//
//    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("DropDownView init(coder:) has not been implemented")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5//dropDownOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "XoXoXo" //dropDownOptions[indexPath.row]
        cell.backgroundColor = UIColor.green

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dropDownOptions[indexPath.row])
    }



}





