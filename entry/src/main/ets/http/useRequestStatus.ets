import axios from '@ohos/axios';
import { ViewStateConstant } from '../cons/ViewStateConstant';
import { CommonType } from '../model/typeAlias/TypeAlias';


export interface LoadStateResult {
  promise: <T>(requestPromise: Promise<T>, showLoadingState?: boolean) => Promise<T>
}

function updateViewState(state: string, stateCallback?: (state: string) => void) {
  stateCallback?.(state)
}

function run<T>(requestPromise: Promise<T>, checkResult: boolean, showLoadingState?: boolean, stateCallback?: (state: string) => void): Promise<T> {
  if (showLoadingState !== false) {
    updateViewState(ViewStateConstant.VIEW_STATE_LOADING, stateCallback)
  }
  return new Promise<T>((resolve, reject) => {
    requestPromise.then((res) => {
      updateViewState(ViewStateConstant.VIEW_STATE_SUCCESS, stateCallback)
      resolve(res);
    }).catch((error: CommonType) => {
      if (axios.isAxiosError(error)) {
        updateViewState(ViewStateConstant.VIEW_STATE_NETWORK_ERROR, stateCallback)
      } else {
        updateViewState(ViewStateConstant.VIEW_STATE_ERROR, stateCallback)
      }
      reject(error);
    })
  })
}

function useRequestStatus(stateCallback?: (state: string) => void, checkResult: boolean = false): LoadStateResult {
  return {
    promise: (requestPromise, showLoadingState) => run(requestPromise, checkResult, showLoadingState, stateCallback)
  };
}

export default useRequestStatus;


