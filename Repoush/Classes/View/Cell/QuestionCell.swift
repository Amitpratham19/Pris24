//
//  QuestionCell.swift
//  Repoush
//
//  Created by Ravi Sendhav on 3/21/20.
//  Copyright © 2020 Ravi Sendhav. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var imgviewUser: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblAnswerBySeller: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnReply: UIButton!

    @IBOutlet weak var btnReplyWidthContraint: NSLayoutConstraint!

    var editHandler: (() -> Void)?
    var deleteHandler: (() -> Void)?
    var replyHandler: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: Action Methods
    @IBAction func btnEdit_Action(_ sender: UIButton) {
        if (editHandler != nil) {
            editHandler!()
        }
    }
    
    @IBAction func btnDelete_Action(_ sender: UIButton) {
        if (deleteHandler != nil) {
            deleteHandler!()
        }
    }

    @IBAction func btnReply_Action(_ sender: UIButton) {
        if (replyHandler != nil) {
            replyHandler!()
        }
    }

}
