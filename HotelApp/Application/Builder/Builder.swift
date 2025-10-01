import UIKit

protocol BuilderProtocol {
    func createHotelModule(router: RouterProtocol) -> UIViewController
    func createRoomModele(router: RouterProtocol) -> UIViewController
    func createBookingModule(router: RouterProtocol) -> UIViewController
    func createSuccessModule(router: RouterProtocol) -> UIViewController
}

class Builder: BuilderProtocol {
    func createHotelModule(router: RouterProtocol) -> UIViewController {
        let presenter = HotelPresenter(router: router)
        let view = HotelViewController(presenter: presenter)
        return view
    }
    
    func createRoomModele(router: RouterProtocol) -> UIViewController {
        let presenter = RoomPresenter(router: router)
        let view = RoomViewController(presenter: presenter)
        return view
    }
    
    func createBookingModule(router: RouterProtocol) -> UIViewController {
        let presenter = BookingPresenter(router: router)
        let view = BookingViewController(presenter: presenter)
        return view
    }
    
    func createSuccessModule(router: RouterProtocol) -> UIViewController {
        let presenter = SuccessPresenter(router: router)
        let view = SuccessViewController(presenter: presenter)
        return view
    }
}
