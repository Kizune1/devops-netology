# Домашнее задание к занятию 7 «Жизненный цикл ПО» Повечеровский А.В.

## Подготовка к выполнению

1. Получить бесплатную версию [Jira](https://www.atlassian.com/ru/software/jira/free).
2. Настроить её для своей команды разработки.
3. Создать доски Kanban и Scrum.
4. [Дополнительные инструкции от разработчика Jira](https://support.atlassian.com/jira-cloud-administration/docs/import-and-export-issue-workflows/).

## Основная часть

Необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить жизненный цикл:

1. Open -> On reproduce.
2. On reproduce -> Open, Done reproduce.
3. Done reproduce -> On fix.
4. On fix -> On reproduce, Done fix.
5. Done fix -> On test.
6. On test -> On fix, Done.
7. Done -> Closed, Open.
![](./res/workflow_bugs.png)
Остальные задачи должны проходить по упрощённому workflow:

1. Open -> On develop.
2. On develop -> Open, Done develop.
3. Done develop -> On test.
4. On test -> On develop, Done.
5. Done -> Closed, Open.
![](./res/workflow.png)
**Что нужно сделать**

1. Создайте задачу с типом bug, попытайтесь провести его по всему workflow до Done.
![](./res/sprint_1.png)
![](./res/sprint_2.png)
1. Создайте задачу с типом epic, к ней привяжите несколько задач с типом task, проведите их по всему workflow до Done.
![](./res/epic_scr1.png)
![](./res/epic_scr2.png)
1. При проведении обеих задач по статусам используйте kanban.
```
    Натсроил workflow в разных проектах, чтобы интереснее было.
``` 
1. Верните задачи в статус Open.
1. Перейдите в Scrum, запланируйте новый спринт, состоящий из задач эпика и одного бага, стартуйте спринт, проведите задачи до состояния Closed. Закройте спринт.
![](./res/prepare_to_start_sprint.png)
![](./res/prepare_to_start_sprint2.png)
![](./res/epic_scr1.png)
![](./res/epic_scr2.png)
![](./res/close_sprint.png)
2. Если всё отработалось в рамках ожидания — выгрузите схемы workflow для импорта в XML. Файлы с workflow и скриншоты workflow приложите к решению задания.
- [XML workflow for all tasks](./res/all_tasks.xml)
- [XML workflow for bugs](./res/for_bugs.xml)

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---