# ff-WebLogger
![Windows Batch](https://img.shields.io/badge/Windows%20Batch-%23909090.svg?style=for-the-badge&logo=Windows&logoColor=white)
[![Licence](https://img.shields.io/github/license/ykmn/ff-Logger?style=for-the-badge)](./LICENSE)
![Microsoft Windows](https://img.shields.io/badge/Microsoft-Windows-%FF5F91FF.svg?style=for-the-badge&logo=Microsoft%20Windows&logoColor=white)

> 2024-09-05 Roman Ermakov <r.ermakov@emg.fm>

* ff-WebLoggger.bat: Логгер веб-аудиопотока с функцией watchdog.

* ff-Run.bat: Скрипт для одновременного запуска нескольких логгеров для разных источников.

Для работы требуется ffmpeg (`winget install ffmpeg`).


## Использование:

### ff-Run

В файле `ff-Run.bat` необходимо в нужном количестве указать параметры подключения:

```
set url=https://pub0202.101.ru:8000/stream/air/aac/64/100
set station="Autoradio Moscow"
set filetype=aac
set storage="D:\STORAGE"
start "%station% Logger Watchdog" ff-WebLogger.bat %url% %station% %storage% %filetype%
```

* `url=` ссылка на аудиопоток

* `station=` название потока, используется при создании папки.
Если хотите использовать название с пробелами, заключите его в кавычки.

* `filetype=` расширение сохраняемых файлов. Желательно использовать тип файла
соответствующий потоку, т.е. mp3 для Icecast/mp3, aac для Icecast/aac, aac для HLS и т.д.

* `storage=` путь к папке, где будут сохраняться записанные файлы. В ней автоматически
будет создана папка с названием `station`, в которую будут сохраняться
аудиофайлы в формате `15-00.aac` (часы-минуты)


### ff-WebLogger

Приложение-watchdog, запускающее дочерний процесс с ffmpeg и перезапускающее его
через 3 секунды при выходе или аварийном завершении. Путь к ffmpeg должен быть
добавлен в PATH. В совеременных Windows вы можете установить ffmpeg при помощи
команды `winget install ffmpeg`

Логи ffmpeg (уровень 24, предупреждения) пишутся в .\LOG\названиепотока

Логи старше 30 дней удаляются при запуске скрипта.

Новый аудиофайл создаётся каждые 10 минут (задаётся в `-segment_time 00:10:00`)

## История версий:
* 2024-09-05 - v1.00 Начальная версия
