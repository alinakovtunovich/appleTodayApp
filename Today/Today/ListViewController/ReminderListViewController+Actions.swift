//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Ayrmidon Hagraven on 5/24/24.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
