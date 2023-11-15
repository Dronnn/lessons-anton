
m-v-c

m-v-p

m-v-vm

- model
- view
- view model


// --------------- mvvm
class ViewController {

    var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    // reactive: RxSwift - Combine
    // delegate
    // closures

    func bind() {
        viewModel.dataChanged = { data in
            self.showAnswer()
        }
        viewModel.data...
    }

    func buttonPressed() {
        viewModel.handleUserInpot()
    }

    private func showAnswer() {
        label.text = "answer"
    }
}

class ViewModel {
    // no back connections

    var data: Int = 0

    var dataChanged = ((Int) -> Void)?

    func handleUserInpot() {
        handleData()
    }

    private func handleData() {
        // let x = service.getData()
        dataChanged?(x)
    }
}


let vc = ViewController(viewModel: ViewModel())


// ------------------------------- mvp

class ViewController {
    var presenter

//     presenter.userPressedButton()
}

class Presenter {
    weak var viewController: ...?

//    viewController.showData()
}





