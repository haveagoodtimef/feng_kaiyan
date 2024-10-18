/**
 * axios请求客户端创建
 */
import { AxiosRequestHeaders, AxiosResponse } from '@ohos/axios';
import AxiosHttpRequest, { HttpRequestConfig } from './AxiosHttpRequest';

const axiosClient = new AxiosHttpRequest({
  baseURL: "/api",
  timeout: 10 * 1000,
  checkResultCode: false,
  headers: {
    'Content-Type': 'application/json'
  } as AxiosRequestHeaders,
  interceptorHooks: {
    requestInterceptor: async (config) => {
      // 在发送请求之前做一些处理，例如打印请求信息
      axiosClient.config.showLoading = config.showLoading
      return config;
    },
    requestInterceptorCatch: (err) => {
      return err;
    },
    responseInterceptor: (response: AxiosResponse) => {
      //优先执行自己的请求响应拦截器，在执行通用请求request的
      if (response.status === 200) {
        let config = response.config as HttpRequestConfig
        const checkResultCode = config.checkResultCode
        if (checkResultCode && response.data.errorCode != 0) {
          return Promise.reject(response)
        }
        return Promise.resolve(response.data);
      } else {
        return Promise.reject(response);
      }
    },
    responseInterceptorCatch: (error) => {

      return Promise.reject(error);
    },
  }
})

export default axiosClient;