export default class BAAnimationModel {
  imgRes: Resource
  poxX: number
  delay: number

  constructor(imgRes: Resource, poxX: number, delay: number) {
    this.imgRes = imgRes
    this.poxX = poxX
    this.delay = delay
  }
}