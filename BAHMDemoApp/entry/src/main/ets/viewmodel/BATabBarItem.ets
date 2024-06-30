export default class BATabBarItem {
  title: string
  defaultIcon: Resource
  selectedIcon: Resource

  constructor(title: string, defaultIcon: Resource, selectedIcon: Resource) {
    this.title = title
    this.defaultIcon = defaultIcon
    this.selectedIcon = selectedIcon
  }
}