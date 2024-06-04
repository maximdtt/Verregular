//
//  SelectVerbTableViewCell.swift
//  VerbMemoryGame
//
//  Created by Maksims Šalajevs on 25/05/2024.
//

import UIKit
import SnapKit

final class SelectVerbTableViewCell: UITableViewCell {

	static let reuseID = "SelectVerbTableViewCell"

    enum State {
        case select, unselect

        var image: UIImage {
            switch self {
            case .select:
                return UIImage.checkmark

            case .unselect:
                return UIImage(systemName: "circlebadge") ?? UIImage.add
            }
        }
    }

    // MARK: - UI Variables
    private lazy var checkboxImageView: UIImageView = {
        let view = UIImageView()
        view.image = State.unselect.image
        view.contentMode = .center
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .center
        view.spacing = 5
        return view
    }()
    
    private lazy var infinitiveView: UIView = UIView()
	// example (можем создать функцию которая будет возвращать сконфигурированный лейбл, уменьшим дублирование кода)
	private lazy var infinitiveLabel = createLabel(isBold: true, size: 16)
	private lazy var translationLabel = createLabel(isBold: false, size: 12, color: .gray)
	private lazy var pastLabel = createLabel(isBold: false, size: 16, aligment: .center)
	private lazy var participleLabel = createLabel(isBold: false, size: 16, aligment: .center)
	
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configure(with verb: Verb, isSelected: Bool) {
        infinitiveLabel.text = verb.infinitive
        translationLabel.text = verb.translation
        pastLabel.text = verb.pastSimple
        participleLabel.text = verb.participle 
        
        checkboxImageView.image = isSelected ? State.select.image : State.unselect.image
    }
    
    // MARK: - Private methods
    
	private func setupUI() {
        
        infinitiveView.addSubviews([infinitiveLabel, translationLabel])
        stackView.addArrangedSubviews([infinitiveView, pastLabel, participleLabel])
        addSubviews([checkboxImageView, stackView])
		selectionStyle = .none
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        checkboxImageView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        infinitiveLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        translationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(infinitiveLabel.snp.bottom).offset(0)
        }
        
        infinitiveView.snp.makeConstraints { make in
            make.height.equalTo(69)
        }
        
		// example you can use "$0"
        stackView.snp.makeConstraints {
            $0.leading.equalTo(checkboxImageView.snp.trailing).offset(5)
			$0.top.right.bottom.equalToSuperview()
        }
    }
	
	// just for example
	private func createLabel(isBold: Bool,
							 size: CGFloat,
							 aligment: NSTextAlignment? = nil,
							 color: UIColor? = nil) -> UILabel {
		let label = UILabel()
		label.font = isBold ? .boldSystemFont(ofSize: size) : .systemFont(ofSize: size)
		if let aligment {
			label.textAlignment = aligment
		}
		if let color {
			label.textColor = color
		}
		return label
	}
}
