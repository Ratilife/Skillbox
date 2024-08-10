﻿ // Функция формирует фамилию, имя и отчество одной строкой
//
// Параметры
//  Фамилия  - фамилия физ. лица.
//  Имя      - имя физ. лица.
//  Отчество - отчество физ. лица.
//  ФИОКратко    - Булево - если Истина (по умолчанию), Представление физ.лица включает фамилию и инициалы, если Ложь - фамилию и полностью имя и отчество
//
// Возвращаемое значение
//  Фамилия, имя, отчество одной строкой.
//
Функция ПолучитьФамилиюИмяОтчество(Фамилия = " ", Имя = " ", Отчество = " ", ФИОКратко = Истина) Экспорт

	Если ФИОКратко Тогда
		Возврат ?(НЕ ПустаяСтрока(Фамилия), Фамилия + ?(НЕ ПустаяСтрока(Имя)," " + Лев(Имя,1) + "." +
				?(НЕ ПустаяСтрока(Отчество) ,
				Лев(Отчество,1)+".", ""), ""), "");
	Иначе
		Возврат ?(НЕ ПустаяСтрока(Фамилия), Фамилия + ?(НЕ ПустаяСтрока(Имя)," " + Имя +
				?(НЕ ПустаяСтрока(Отчество) , " " + Отчество, ""), ""), "");
	КонецЕсли;

КонецФункции // ПолучитьФамилиюИмяОтчество()