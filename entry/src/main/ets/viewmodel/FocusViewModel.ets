import { getFocusData } from '../http/ApiServers';
import { FocusModelItemList } from '../model/FocusModel';
import { TabItem } from '../model/TabItem';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class FocusViewModel extends BaseViewModel {

  tabTitle: Array<TabItem> = [
    {
      index: 0,
      title: "关注"
    },
    {
      index: 1,
      title: "分类"
    },
    {
      index: 2,
      title: "主题"
    }
  ]

  async getFocusData(resultCallback: ResultCallback<FocusModelItemList[]>) {
    await this.httpRequest(getFocusData()).then((result) => {
        resultCallback(result.itemList)
      })
  }


}

let focusViewModel = new FocusViewModel()

export default focusViewModel as FocusViewModel