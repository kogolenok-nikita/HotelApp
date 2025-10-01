import UIKit

protocol HotelPresenterProtocol: AnyObject {
    func attechView(_ view: HotelViewProtocol)
    func viedDidLoad()
    func numberOfRows() -> Int
    func item(at intex: Int) -> BodyModel
    func didTapContinue()
}

class HotelPresenter: HotelPresenterProtocol {
    private weak var view: HotelViewProtocol?
    private let router: RouterProtocol
    private var hotelItems: [BodyModel] = []
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func attechView(_ view: any HotelViewProtocol) {
        self.view = view
    }
    
    func viedDidLoad() {
        hotelItems = [
            BodyModel(icon: "happyIcon", title: "Убодства", detail: "Самое необходимое"),
            BodyModel(icon: "tickIcon", title: "Что включено", detail: "Самое необходимое"),
            BodyModel(icon: "closeIcon", title: "Что не включено", detail: "Самое необходимое"),
        ]
        view?.reload()
    }
    
    func numberOfRows() -> Int {
        return hotelItems.count
    }
    
    func item(at intex: Int) -> BodyModel {
        return hotelItems[intex]
    }
    
    func didTapContinue() {
        router.navigateToRoom()
    }
}
