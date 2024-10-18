import { getFocusData } from '../http/ApiServers';
import { FocusModelItemList } from '../model/FocusModel';
import { TabItem } from '../model/TabItem';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class FindViewModel extends BaseViewModel {

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



}

let findViewModel = new FindViewModel()

export default findViewModel as FindViewModel