
@Observed
export class HorizontalVideoItem {
  id: number
  image: Resource
  name: string

  constructor(id: number, image: Resource, name: string) {
    this.id = id
    this.image = image
    this.name = name
  }
}