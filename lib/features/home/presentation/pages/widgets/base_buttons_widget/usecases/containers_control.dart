enum ContainerType { task, calendar, product, none }

class ContainersControl {
  ContainerType activeContainer = ContainerType.none;

  void changeContainer(ContainerType selected) {
    if (activeContainer == selected) {
      // Если нажали тот же контейнер — сбрасываем выбор
      activeContainer = ContainerType.none;
    } else {
      // Иначе активируем выбранный
      activeContainer = selected;
    }
  }
}
