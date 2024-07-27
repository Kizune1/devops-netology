# Домашнее задание к занятию 11 «Teamcity» Повечеровский А.В.

## Подготовка к выполнению

1. В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа `jetbrains/teamcity-server`.<br/>
**-- Машины не создавал, т.к. YC платный. Контейнеры подняты на своих мощностях.**
![Containers](./src/containers.png)

2. Дождитесь запуска teamcity, выполните первоначальную настройку.<br/>
**-- Первоначальная настройка выполнена.**
![Teamcity_start](./src/Teamcity_start.png)

3. Создайте ещё один инстанс (2CPU4RAM) на основе образа `jetbrains/teamcity-agent`. Пропишите к нему переменную окружения `SERVER_URL: "http://<teamcity_url>:8111"`.<br/>
**-- Поднят контейнер с агентом Teamcity.**

4. Авторизуйте агент.<br/>
**-- Агент авторизирован на сервере.**
![Auth_agent](./src/auth_agent.png)

5. Сделайте fork [репозитория](https://github.com/aragastmatb/example-teamcity).<br/>
**-- Fork сделан.**
![Fork](./src/fork.png)

6. Создайте VM (2CPU4RAM) и запустите [playbook](./infrastructure).<br/>
**-- Nexus так же поднят в контейнере. Docker-compose file ниже.**
[Docker-compose](./src/docker-compose.yml)

## Основная часть

1. Создайте новый проект в teamcity на основе fork.<br/>
**-- Проект создан**
![Teamcity_project](./src/Teamcity_project.png)

2. Сделайте autodetect конфигурации.<br/>
**-- Конфигурация Maven создана.**
![Teamcity_auto](./src/Teamcity_autodetect.png)

3. Сохраните необходимые шаги, запустите первую сборку master.<br/>
**-- Сборка прошла успешно.**
![Teamcity_first_build](./src/Teamcity_first_build.png)

4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.<br/>
**-- Условия сборки изменены.**
![Maven_settings](./src/Maven_settings.png)

5. Для deploy будет необходимо загрузить [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.<br/>
**-- settings.xml добавлен в набор конфигураций maven.**
[settings.xml](./src/settings.xml)

6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.<br/>
**-- pom.xml изменён согласно инфраструктуры.**
[pom.xml](./src/pom.xml)

7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.<br/>
**-- Сборка запущена автоматически, т.к. изменения запушены в мастер. Завершена корректно. Данные попали в nexus.**
![auto_build_add_nexus](./src/auto_build_add_nexus.png)
![nexus_art](./src/nexus_art.png)

8. Мигрируйте `build configuration` в репозиторий.<br/>
**-- Изменения производились непосредственно в репозитории.**

9. Создайте отдельную ветку `feature/add_reply` в репозитории.<br/>
**-- Ветка создана.**
![new_branch](./src/new_branch.png)

10. Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.<br/>
**-- Создан новый метод sayHunter**
![add_method](./src/add_method.png)

11. Дополните тест для нового метода на поиск слова `hunter` в новой реплике.<br/>
**-- Создан новый тест sayHunter**
![add_test_method](./src/add_test_method.png)

12. Сделайте push всех изменений в новую ветку репозитория.<br/>
**-- Ветка feature/add_reply обновлена.**

13. Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.<br/>
**-- Тесты запускаются самостоятельно по триггеру GIT.**
![auto_build.png](./src/auto_build.png)

14. Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.<br/>
**-- Ветки смержены.**
![merge](./src/merge.png)

15. Убедитесь, что нет собранного артефакта в сборке по ветке `master`.<br/>
**-- Убедился после ошибки обновления артефакта с такой же версией во время сборки))**
[faillog build - publish art  ](./src/faill_nexus.log)

16. Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.<br/>
**-- Итак собтраются .jar артефакты.**

17. Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.<br/>
**-- Все сборки отрабатывают корректно и автоматически после комитов в мастер github**
![all_builds](./src/all_builds.png)

18. Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.<br/>
**-- Всё на месте.**
![nexus_ver_art](./src/nexus_ver_art.png)

19. В ответе пришлите ссылку на репозиторий.<br/>
[Репозиторий Kizune1/example-teamcity](https://github.com/Kizune1/example-teamcity)


---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---