# 2.6 Жесты и анимация

На занятии вы узнали про использование жестов и настройку анимаций в UIKit.

В этом практическом задании вам нужно изменить предыдущий проект, добавив анимации для показа аватара пользователя.

### Важно!

Домашнее задание нужно выполнить в том же проекте, в котором вы выполняли предыдущее домашнее задание. Выполненное задание необходимо заархивировать и прикрепить в личном кабинете. Если какие-то пункты из домашнего задания остались непонятны, задавайте вопросы в чат учебной группы.

### Основное задание

1. На экране ProfileViewController добавьте обработку однократного нажатия на аватар пользователя.
2. При срабатывании нажатия должна запускаться анимация:
  - Аватар пользователя перемещается в центр экрана и растягивается по ширине экрана, высота должна быть пропорциональной;
  - Под аватаром пользователя показывается полупрозначная view, которая перекрывает остальные элементы на экране. Должна изменяться только прозрачность view;
  - В правом верхнем углу появляется кнопка с иконкой крестика. Кнопка должна оставаться на одном месте, должна изменяться только прозрачность кнопки.
Анимации аватара и view должны запускаться одновременно и длиться 0.5 секунды. Анимация кнопки должна запускаться после завершения анимации аватара и view и должна длиться 0.3 секунды
3. При нажатии на кнопку с иконкой крестика запускается обратная анимация: 
- Скрывается кнопка с иконкой крестика
- Аватар возвращается в начальное положение, полупрозрачная view скрывается.

### * Дополнительное задание
Добавьте анимацию для изменения cornerRadius у аватара пользователя. В начальном положении cornerRadius должен быть равен половине высоты imageView, в увеличенном состоянии - равен нулю.

Заархивируйте готовую работу в .zip-файл и прикрепите в личном кабинете.
