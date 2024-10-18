import axios from '@ohos/axios';
import { ViewStateConstant } from '../cons/ViewStateConstant';
import { CommonType } from '../model/typeAlias/TypeAlias';


export interface LoadStateResult {
  promise: <T> (requestPromise: Promise<T>) => Promise<T>
}


function run<T> (requestPromise: Promise<T>): Promise<T> {
  return new Promise<T>((resolve, reject) => {
    requestPromise.then((res) => {
      resolve(res);
    }).catch((error: CommonType) => {
      reject(error);
    })
  })
}

function useRequestStatus(): LoadStateResult {
  return {
    promise: (requestPromise) => run(requestPromise)
  };
}

export default useRequestStatus;


