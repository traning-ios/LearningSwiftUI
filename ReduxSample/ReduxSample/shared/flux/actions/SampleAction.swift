//
//  SampleAction.swift
//  ReduxSample
//
//  Created by Le Xuan Quynh on 2020/02/06.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import Foundation
import SwiftUIFlux


struct SampleAction {
    static var currentNum = 0

    struct FetchSampleAction: AsyncAction {
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            //only test
            currentNum += 1
            let fakeRespone = PaginatedResponse(page: 1, total_results: 1, total_pages: 1, results: [SampleVO(id: 1, number: currentNum)])
            dispatch(SetSampleAction(response: fakeRespone))
            /*
            APIService.shared.GET(endpoint: APIService.Endpoint.sampleApi, params: nil) { (result: Result<PaginatedResponse<SampleVO>, APIService.APIError>) in
            switch result {
            case let .success(response):
                dispatch(SetSampleAction(response: response))
            case let .failure(error):
                print(error)
                break
            }
            }
            */
        }
    }

    struct SetSampleAction: Action {
        let response: PaginatedResponse<SampleVO>
    }
}
