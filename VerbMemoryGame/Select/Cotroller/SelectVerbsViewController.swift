//
//  SelectVerbsViewController.swift
//  VerbMemoryGame
//
//  Created by Maksims Šalajevs on 24/05/2024.
//

import UIKit

final class SelectVerbsViewController: UITableViewController {
	
	private struct UIConstants {
		static let title = "Select verbs"
	}

	// MARK: - Properties
	
	private var dataSource = IrregularVerbs.shared
	
	// MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = UIConstants.title.localized
		view.backgroundColor = .white
																				// use Cell id
		tableView.register(SelectVerbTableViewCell.self, forCellReuseIdentifier: SelectVerbTableViewCell.reuseID)
	}

	// MARK: - Private methods

	private func isSelected(verb: Verb) -> Bool {
		dataSource.selectedVerbs.contains(where: { $0.infinitive == verb.infinitive })
	}
}

// MARK: - UITableViewDataSource

extension SelectVerbsViewController {
	override func tableView(_ tableView: UITableView,
							numberOfRowsInSection section: Int) -> Int {
		dataSource.verbs.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
																		// use Cell id
		guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectVerbTableViewCell.reuseID, for: indexPath) as? SelectVerbTableViewCell else {
			return UITableViewCell() }

		let verb = dataSource.verbs[indexPath.row]
		cell.configure(with: verb, isSelected: isSelected(verb: verb))

		return cell
	}
}

// MARK: - UITableViewDelegate

extension SelectVerbsViewController {
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let verb = dataSource.verbs[indexPath.row]
		if isSelected(verb: verb) {
			dataSource.selectedVerbs.removeAll(where: { $0.infinitive == verb.infinitive })
		} else {
			dataSource.selectedVerbs.append(verb)
		}
		tableView.reloadRows(at: [indexPath], with: .automatic)
	}
}
