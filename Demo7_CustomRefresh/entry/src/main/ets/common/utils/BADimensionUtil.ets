/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import display from '@ohos.display';
import { BAGlobalContext } from './BAGlobalContext';
import BALogger from './BALogger'
// import FileManagerIndex from '../../pages/FileManagerIndex';


let context = getContext(this);
const DESIGN_WIDTH = 360;
const DESIGN_HEIGHT = 780;

/**
 * Fits tools with different sizes and lengths
 */
export default class BADimensionUtil {
  static adaptDimension(value: number): number {
    let deviceDisplay: display.Display = BAGlobalContext.getContext().getObject('display') as display.Display;
    // BALogger.info('设备宽：' + deviceDisplay.width + '，高：' + deviceDisplay.height)
    let widthScale = deviceDisplay.width / DESIGN_WIDTH;
    let virtualHeight = widthScale * DESIGN_HEIGHT;
    let designDim = Math.sqrt(DESIGN_WIDTH * DESIGN_WIDTH + DESIGN_HEIGHT * DESIGN_HEIGHT);
    let virtualDim = Math.sqrt(deviceDisplay.width * deviceDisplay.width + virtualHeight * virtualHeight);
    return virtualDim * value / designDim;
  }

  /**
   * Obtains the screen horizontal adaptation px.
   */
  static getPx(value: Resource): number {
    let beforeVp = context.resourceManager.getNumber(value.id);
    return BADimensionUtil.adaptDimension(beforeVp);
  }

  /**
   * Obtains the screen horizontal adaptation vp.
   */
  static getVp(value: Resource): number {
    let beforeVp = context.resourceManager.getNumber(value.id);
    return px2vp(BADimensionUtil.adaptDimension(beforeVp));
  }

  /**
   * Obtains the screen horizontal adaptation fp.
   */
  static getFp(value: Resource): number {
    let beforeFp = context.resourceManager.getNumber(value.id);
    return px2fp(BADimensionUtil.adaptDimension(beforeFp));
  }
}