import { AxiosHeaders } from '@ohos/axios'
import { FocusModel } from '../model/FocusModel'
import { HomeModel } from '../model/HomeModel'
import axiosClient from './AxiosRequest'

let baseUrl = "https://baobab.kaiyanapp.com/"
const commonHeader: AxiosHeaders = new AxiosHeaders()

/**
 * 请求首页数据-axios客户端请求
 * @param date
 * @returns
 */
export function getHomeListAxios() {
  return axiosClient.get<HomeModel>({
    url: baseUrl + "api/v2/feed",
    headers: commonHeader
  })
}


/**
 * 获取关注接口
 */
export function getFocusData() {
  return axiosClient.get<FocusModel>({
      url: baseUrl + "api/v4/tabs/follow",
      headers: commonHeader
    }
  )
}