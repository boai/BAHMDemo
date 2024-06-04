
export default class BADemoListItemModel {
  index: string
  img: Resource
  title: string
  content: string
  url: string

  constructor(index: string, img: Resource, title: string, content: string, url: string) {
    this.index = index
    this.img = img
    this.title = title
    this.content = content
    this.url = url
  }
}