import { FocusModelItemList } from '../../../model/FocusModel'
import FocusViewModel from '../../../viewmodel/FocusViewModel'
import { FocusItemComponent } from './FocusItemComponent'

@Component
export struct FocusPage {
  @State isRefreshing: boolean = false
  @State dataList: FocusModelItemList[] = []


  aboutToAppear(): void {

    FocusViewModel.getFocusData((result) => {
      this.dataList = result
    })
  }



  build() {
    Refresh({ refreshing: $$this.isRefreshing, offset: 100, friction: 100 }) {
      List({ space: 10, initialIndex: 0 }) {
        ForEach(this.dataList, (item: FocusModelItemList, index: number) => {
          ListItem() {
            FocusItemComponent({ item: item })
          }
        })
      }
      .listDirection(Axis.Vertical) // 排列方向
      .divider({
        strokeWidth: 1,
        color: $r('app.color.color_f5f5f5'),
        startMargin: 10,
        endMargin: 10
      }) // 每行之间的分界线
      .onReachEnd(() => {

      })
    }
    .onRefreshing(() => {

    }).padding({ left: 10, right: 10 })

  }
}