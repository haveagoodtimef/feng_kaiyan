import useRequestStatus, { LoadStateResult } from '../http/useRequestStatus'

export type StateCallback = (state: string) => void

/**
 * 定义回调函数类型
 */
export type ResultCallback<T> = (result: T) => void


export class BaseViewModel {


  /**
   * 发起网络请求的功能
   * @returns
   */
  httpRequest(): LoadStateResult {
    return useRequestStatus()
  }
}