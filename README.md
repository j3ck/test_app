Test task

example admin: 
email:  admin@admin.com
username: admin
pass: 123456789


Карта сайта
* +главная страница
* +страница информации о книге
* +страница результатов поиска
* +страница авторизации (вход в админку)
* +страница администратора
* +страница модератора

Главная страница
* +страница должна содержать: список из названия, автора, обложки количество коментариев;
* +постраничную разбивку книг (по 10 книг на страницу);
* +название и обложка являются ссылкой на “страницу информации о книге”;

Cтраница информации о книге
* +страница должна содержать: все данные о книге;
* +вывести списком ссылок все книги того же автора;
* +форма комментирования;
* +список комментариев;
Комментарии обладают следующими характеристиками
* +email;
* +фио;
* +текст комментария;
* +комментарии имеет древовидную структуру
* +комментировать может любой пользователь
* +комментарии не отображаются пока модератор не переведет коментарий в статус “отмодерировано”
* +все поля для заполнения обязательны
* +комментарии должны добавлятся без перезагрузки страницы

Страница результатов поиска
* +форма поиска должа быть на каждой странице;
* +при вводе поискового запроса пользователь должен оказаться на странице результатов поиска;
* +-поиск производится по названию, автору, описанию;

Страница авторизации (вход в админку) 
* +представляет собой форму ввода email или login и password;
* +авторизация может производиться как по email так и по login;
* +необходимо выводить ошибки авторизации;
* +после успешной авторизации пользователь должен оказатся на странице модератора или администратора в зависимости от роли;

* +каталог книг
* +список книг с ссылками на редактирование и удаление
* +ссылка на добавление книги
Книга обладает следующими характеристиками
1. +название
2. +описание
3. +автор
4. +-обложка (обложку можно прикреплять как файлом, так и указывать ссылку в web)
* +все поля кроме обложки являются обязательными
* +название должно быть не менее 3 символов и не более 150
* +описание должно быть не менее 3 символов
* +автор должн быть не менее 3 символов и не более 150
* +-обложка должна быть не менее 150x150px и не более 2000x2000px, размер файла не более 1mb обложки должны быть приведены к единому размеру (на свое усмотрение)
* +управление пользователями
* +список пользователей с ссылками на редактирование и удаление
* +ссылка на добавление пользователя
Пользователь обладает следующими характеристиками
1. +логин
2. +email
3. +пароль
4. +роль
* +все поля обязательны для заполнения
* +email должен валидироваться по маске
* +модерация комментрариев
* +список комментариев требующих модерации с возможностью удаления и перевода в статус “отмодерировано”

* +модерация комментрариев
* +список комментариев требующих модерации с возможностью удаления и перевода в статус “отмодерировано”
