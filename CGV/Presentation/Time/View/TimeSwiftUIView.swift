//
//  TimeSwiftUIView.swift
//  CGV
//
//  Created by 최안용 on 11/25/24.
//

import SwiftUI

struct TimeSwiftUIView: View {
    @StateObject var viewModel: TimeSwiftUIViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack(alignment: .top) {
                GradientBackgroundView()
                LazyVStack(spacing: 0) {
                    CustomHeaderView(viewModel: viewModel)
                    MovieHeaderView()
                    MovieChartView(viewModel: viewModel)
                    DateView(viewModel: viewModel)
                    SelectedTheaterBarView(viewModel: viewModel)
                    TheaterInfoView(viewModel: viewModel)
                }
            }
        }
        .background(Color.cgvWhite)
        .ignoresSafeArea()
    }
}

// MARK: - CustomHeader View

private struct CustomHeaderView: View {
    @ObservedObject private var viewModel: TimeSwiftUIViewModel
    
    fileprivate init(viewModel: TimeSwiftUIViewModel) {
        self.viewModel = viewModel
    }
    
    fileprivate var body: some View {
        HStack(spacing: Screen.width(19)) {
            VStack {
                Text("영화별예매")
                    .padding(.vertical, Screen.height(5))
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .frame(height: Screen.height(2))
                            .foregroundColor(.cgvWhite)
                    }
            }
            
            Text("극장별예매")
            
            Text("비교예매")
            
            Spacer()
            
            Button {
                viewModel.closeButtonAction()
            } label: {
                Image(.icXWhite)
            }
        }
        .font(Font(uiFont: .kopub(.body4)))
        .foregroundStyle(.cgvWhite)
        .padding(.leading, Screen.width(20))
        .padding(.trailing, Screen.width(9))
        .padding(.top, Screen.height(57))
    }
}

// MARK: - MoviewHeaderView

private struct MovieHeaderView: View {
    fileprivate var body: some View {
        HStack(spacing: 0) {
            Text("글래디에이터 II")
                .font(Font(uiFont: .kopub(.head7)))
                .foregroundStyle(.cgvWhite)
                .padding(.trailing, Screen.width(2))
            
            Image(.icHomeAge1922)
                .resizable()
                .frame(width: Screen.width(30), height: Screen.height(30))
                .padding(.trailing, Screen.width(4))
            
            Text("2시간 28분")
                .font(Font(uiFont: .kopub(.body3)))
                .foregroundStyle(.cgvWhite)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("전체")
                    .font(Font(uiFont: .kopub(.head2)))
                    .foregroundStyle(.cgvR400)
                
            }
            .padding(.vertical, Screen.height(4))
            .padding(.horizontal, Screen.width(10))
            .background {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.cgvWhite)
            }
        }
        .padding(.leading, Screen.width(20))
        .padding(.trailing, Screen.width(17))
        .padding(.top, Screen.height(17))
    }
}

// MARK: - MoviewChartView

private struct MovieChartView: View {
    @ObservedObject private var viewModel: TimeSwiftUIViewModel
    
    fileprivate init(viewModel: TimeSwiftUIViewModel) {
        self.viewModel = viewModel
    }
    
    fileprivate var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.moviePosters) { poster in
                    poster.image
                        .resizable()
                        .frame(width: Screen.width(77), height: Screen.height(103))
                }
            }
            .padding(.horizontal, Screen.width(20))
        }
        .padding(.top, Screen.height(13))
    }
}

// MARK: - DateView

private struct DateView: View {
    @ObservedObject private var viewModel: TimeSwiftUIViewModel
    
    fileprivate init(viewModel: TimeSwiftUIViewModel) {
        self.viewModel = viewModel
    }
    
    fileprivate var body: some View {
        VStack(alignment: .leading, spacing: Screen.height(9)) {
            Text("2024.11.05 (월)")
                .font(Font(uiFont: .kopub(.head4)))
                .foregroundStyle(.cgvBlack)
            HStack(spacing: Screen.width(9)) {
                ForEach(viewModel.dateInfo, id: \.self) { date in
                    DateCell(date: date)
                }
            }
        }
        .padding(.horizontal, Screen.width(20))
        .padding(.top, Screen.height(31))
    }
}

// MARK: - SelectedTheaterBarView

private struct SelectedTheaterBarView: View {
    @ObservedObject private var viewModel: TimeSwiftUIViewModel
    
    fileprivate init(viewModel: TimeSwiftUIViewModel) {
        self.viewModel = viewModel
    }
    
    fileprivate var body: some View {
        HStack(spacing: 0) {
            Text("선택된 극장")
                .font(Font(uiFont: .kopub(.body3)))
                .foregroundStyle(.cgvBlack)
                .padding(.trailing, Screen.width(6))
            Text("\(viewModel.theaterTimeTables.count)")
                .font(Font(uiFont: .kopub(.head4)))
                .foregroundStyle(.cgvR400)
                .padding(.trailing, Screen.width(10))
            Button {
                viewModel.theaterChangeButtonAction()
            } label: {
                Text(viewModel.theaterTimeTables.isEmpty ? "극장선택" : "극장변경")
                    .font(Font(uiFont: .kopub(.body3)))
                    .foregroundStyle(viewModel.theaterTimeTables.isEmpty ? Color.cgvR400 : Color.cgvG600)
            }
            .padding(.horizontal, Screen.width(10))
            .padding(.vertical, Screen.height(2))
            .background {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(viewModel.theaterTimeTables.isEmpty ? Color.cgvR400 : Color.cgvG500, lineWidth: 1)
            }
            
            Spacer()
            
            Image(.icTimeFilter)
            
            Text("필터")
                .font(Font(uiFont: .kopub(.body4)))
                .foregroundStyle(.cgvBlack)
        }
        .padding(.horizontal, Screen.width(20))
        .padding(.vertical, Screen.height(12))
        .background(Color.cgvG100)
        .padding(.top, Screen.height(25))
    }
}

// MARK: - 극장 별 정보를 담은 View

private struct TheaterInfoView: View {
    @ObservedObject private var viewModel: TimeSwiftUIViewModel
    
    fileprivate init(viewModel: TimeSwiftUIViewModel) {
        self.viewModel = viewModel
    }
    
    fileprivate var body: some View {
        if viewModel.theaterTimeTables.isEmpty {
            NotSelectedTheaterView()
        } else {
            ForEach(viewModel.theaterTimeTables) { theaterTimeTable in
                TimeTableView(theaterTimeTable: theaterTimeTable)
                    .padding(.top, Screen.height(24))
                
                Color.cgvG100
                    .frame(height: Screen.height(10))
            }
        }
    }
}

// MARK: - 선택된 극장이 없는 경우의 View

private struct NotSelectedTheaterView: View {
    fileprivate var body: some View {
        Text("극장 위치를 선택해주세요")
            .font(Font(uiFont: .kopub(.body4)))
            .foregroundStyle(.cgvG600)
            .padding(.top, Screen.height(138))
    }
}

// MARK: - 극장 정보와 상영관에 따른 시간표를 담은 View

private struct TimeTableView: View {
    private let theaterTimeTable: TheaterTimeTable
    
    fileprivate init(theaterTimeTable: TheaterTimeTable) {
        self.theaterTimeTable = theaterTimeTable
    }
    
    fileprivate var body: some View {
        LazyVStack(spacing: 0) {
            HStack(spacing: Screen.width(2)) {
                Image(.icTimeLocation)
                    .resizable()
                    .frame(width: Screen.width(24), height: Screen.height(24))
                
                Text(theaterTimeTable.theaterName)
                    .font(Font(uiFont: .kopub(.head6)))
                    .foregroundStyle(.cgvBlack)
                
                Spacer()
            }
            .padding(.horizontal, Screen.width(20))
            .padding(.bottom, Screen.height(20))
            
            ForEach(theaterTimeTable.movieTimeTables) { times in
                LazyVStack(spacing: Screen.height(8)) {
                    HStack {
                        Text(times.auditoriumType)
                            .font(Font(uiFont: .kopub(.head2)))
                        
                        Spacer()
                        
                        Text(times.auditorium)
                            .font(Font(uiFont: .kopub(.body3)))
                    }
                    .padding(.horizontal, Screen.width(20))
                    .foregroundStyle(.cgvG600)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: Screen.width(4)) {
                            ForEach(times.timeInfos) { timeInfo in
                                TimeCell(timeInfo: timeInfo) {
                                    // TODO: - TimeCell 클릭시 이벤트 추가
                                }
                            }
                        }
                        .padding(.horizontal, Screen.width(20))
                    }
                }
            }
            .padding(.bottom, Screen.height(24))
        }
    }
}

#Preview {
    TimeSwiftUIView(viewModel: .init(theaterChangeButtonAction: {}, closeButtonAction: {}))
}
