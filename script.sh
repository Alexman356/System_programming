#!/bin/bash

author="Шарапов Александр и Руденко Максим"
program_name="Управление файлами"
description="Скрипт для создания, удаления и перемещения файлов"

echo "Автор: $author"
echo "Название программы: $program_name"
echo "Описание: $description"

while true; do
    echo -e "\nВыберите операцию над файлом:"
    echo "1. Создать файл"
    echo "2. Удалить файл"
    echo "3. Переместить файл"
    echo "4. Выйти из программы"

    read -p "Введите номер операции (1-4): " choice

    case $choice in
        1)
            read -p "Введите имя нового файла: " filename
            if [ -e "$filename" ]; then
                echo "Ошибка: Файл с именем $filename уже существует." >&2
            else
                touch "$filename"
                echo "Файл $filename создан успешно."
            fi
            ;;
        2)
            read -p "Введите имя файла для удаления: " filename
            if [ -e "$filename" ]; then
                rm "$filename"
                echo "Файл $filename удален успешно."
            else
                echo "Ошибка: Файл с именем $filename не существует." >&2
            fi
            ;;
        3)
            read -p "Введите имя файла для перемещения: " filename
            if [ -e "$filename" ]; then
                read -p "Введите путь к каталогу для перемещения файла: " destination
                if [ -d "$destination" ]; then
                    mv "$filename" "$destination/"
                    echo "Файл $filename перемещен в $destination успешно."
                else
                    echo "Ошибка: Каталог $destination не существует." >&2
                fi
            else
                echo "Ошибка: Файл с именем $filename не существует." >&2
            fi
            ;;
        4)
            echo "Программа завершена."
            exit 0
            ;;
        *)
            echo "Ошибка: Введите корректный номер операции (1-4)." >&2
            ;;
    esac

    read -p "Желаете выполнить еще операцию? (y/n): " answer
    case $answer in
        [Nn]*)
            echo "Программа завершена."
            exit 0
            ;;
    esac
done
