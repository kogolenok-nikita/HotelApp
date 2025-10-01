import UIKit

protocol RoomCellDelegate: AnyObject {
    func didTapContinueFromCell(_ cell: RoomCell)
}

class RoomCell: UITableViewCell {
    
    // MARK: - Variable
    static let identifier = "RoomCell"
    weak var delegete: RoomCellDelegate?
    private let builberUIElements = BuilberUIElements.shared
    
    // MARK: - GUI Variable
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.layer.cornerRadius = 12
        view.addSubview(roomImageView)
        view.addSubview(roomTitleLabel)
        view.addSubview(roomViewInfo1)
        view.addSubview(roomViewInfo2)
        view.addSubview(roomStack)
        view.addSubview(roomPriceLabel)
        view.addSubview(roomInfoLabel)
        view.addSubview(roomBtn)
        return view
    }()
        
    lazy var roomImageView  = builberUIElements.createImageView(imageName: "hotel2")
    lazy var roomTitleLabel = builberUIElements.createTitleLabel(title: "Стандартный с видом на бассейн или сад")
    lazy var roomViewInfo1  = builberUIElements.createBodyView(withText: "Все включино")
    lazy var roomViewInfo2  = builberUIElements.createBodyView(withText: "Кондиционер")
    
    lazy var roomStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 9
        stack.backgroundColor = .appBlue.withAlphaComponent(0.2)
        stack.layer.cornerRadius = 5
        stack.addArrangedSubview(roomLabel)
        stack.addArrangedSubview(roomIcon)
        return stack
    }()
    
    lazy var roomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Подробнее о номере"
        label.textColor = .appBlue
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var roomIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = .chevronRightIcon
        img.widthAnchor.constraint(equalToConstant: 24).isActive = true
        img.heightAnchor.constraint(equalToConstant: 24).isActive = true
        img.tintColor = .appBlue
        return img
    }()
    
    lazy var roomPriceLabel = builberUIElements.createPriceLabel(title: "186 600 ₽")
    lazy var roomInfoLabel  = builberUIElements.createGray2Label(title: "за 7 ночей с перелётом")
    lazy var roomBtn        = builberUIElements.createButton(buttomTitle: "Выбрать номер", target: self, action: #selector(roomBtnAction))
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func addSubviews() {
        contentView.addSubview(containerView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            roomImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            roomImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            roomImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            roomImageView.heightAnchor.constraint(equalToConstant: 257),
            
            roomTitleLabel.topAnchor.constraint(equalTo: roomImageView.bottomAnchor, constant: 8),
            roomTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            roomTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            roomViewInfo1.topAnchor.constraint(equalTo: roomTitleLabel.bottomAnchor, constant: 8),
            roomViewInfo1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            roomViewInfo1.heightAnchor.constraint(equalToConstant: 29),
            
            roomViewInfo2.topAnchor.constraint(equalTo: roomTitleLabel.bottomAnchor, constant: 8),
            roomViewInfo2.leadingAnchor.constraint(equalTo: roomViewInfo1.trailingAnchor, constant: 8),
            roomViewInfo2.heightAnchor.constraint(equalToConstant: 29),
            
            roomStack.topAnchor.constraint(equalTo: roomViewInfo1.bottomAnchor, constant: 8),
            roomStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            //roomStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            roomStack.heightAnchor.constraint(equalToConstant: 29),
            
            roomPriceLabel.topAnchor.constraint(equalTo: roomStack.bottomAnchor, constant: 16),
            roomPriceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
//            roomPriceLabel.heightAnchor.constraint(equalToConstant: 36),
            
            roomInfoLabel.topAnchor.constraint(equalTo: roomStack.bottomAnchor, constant: 30),
            roomInfoLabel.leadingAnchor.constraint(equalTo: roomPriceLabel.trailingAnchor, constant: 8),
//            roomInfoLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
//            roomInfoLabel.heightAnchor.constraint(equalToConstant: 19),
            
            roomBtn.topAnchor.constraint(equalTo: roomPriceLabel.bottomAnchor, constant: 16),
            roomBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            roomBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            roomBtn.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    func setRoomModel(model: RoomModel) {
        roomImageView.image = UIImage(named: model.roomImage)
        roomTitleLabel.text = model.roomTitle
        roomPriceLabel.text = model.roomPrice
        roomInfoLabel.text = model.roomInfo
    }
    
    // MARK: - Action
    @objc private func roomBtnAction() {
        delegete?.didTapContinueFromCell(self)
    }
}
