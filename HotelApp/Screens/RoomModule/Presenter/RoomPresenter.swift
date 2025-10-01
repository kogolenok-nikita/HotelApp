import UIKit

protocol RoomPresenterProtocol: AnyObject {
    func attechView(_ view: RoomViewProtocol)
    func viewDidLoad()
    func numberOfRows() -> Int
    func item(at index: Int) -> RoomModel
    func didTapContinue()
    func didTapBack()
}

class RoomPresenter: RoomPresenterProtocol {
    private weak var view: RoomViewProtocol?
    private let router: RouterProtocol
    private var roomItems: [RoomModel] = []
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func attechView(_ view: any RoomViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        roomItems = [
            RoomModel(roomImage: "hotel2", roomTitle: "Стандартный с видом на бассейн или сад", roomPrice: "186 600 ₽", roomInfo: "за 7 ночей с перелётом"),
            RoomModel(roomImage: "hotel1", roomTitle: "Люкс с видом на бассейн или сад", roomPrice: "271 666 ₽", roomInfo: "за 10 ночей без перелёта"),
        ]
        view?.relaod()
    }
    
    func numberOfRows() -> Int {
        return roomItems.count
    }
    
    func  item(at index: Int) -> RoomModel {
        return roomItems[index]
    }
    
    func didTapContinue() {
        router.navigationToBooking()
    }
    
    func didTapBack() {
        router.popToRoot()
    }
}
