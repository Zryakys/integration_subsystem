﻿//©///////////////////////////////////////////////////////////////////////////©//
//
//  Copyright 2021-2024 BIA-Technologies Limited Liability Company
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//©///////////////////////////////////////////////////////////////////////////©//

#Область СлужебныйПрограммныйИнтерфейс

#Область Инициализация

// Подписка на это событие позволяет:
// 
// * выполнить базовую настройку параметров запуска
// * эту настройку можно переопределить параметрами запуска (json файл с настройками)
// * может быть полезно при расширении возможностей движка новыми настраиваемыми механизмами
// * обработчик может (а точнее, должен) изменять `ПараметрыЗапуска`
// 
// Параметры:
//  ПараметрыЗапуска - см. ЮТФабрика.ПараметрыЗапуска
Процедура УстановитьПараметрыЗапускаПоУмолчанию(ПараметрыЗапуска) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ПараметрыЗапуска);
	ВызватьПодключаемыйОбработчикСобытия("УстановитьПараметрыЗапускаПоУмолчанию", "Инициализация", Параметры);
	
КонецПроцедуры

// Вызывается при первичной инициализации глобального контекста.
// Используется для первоначального заполнения контекста, параметра `ДанныеКонтекста`
// Вызывается и для сервера, и для клиента 
// 
// Параметры:
//  ДанныеКонтекста - Структура
Процедура ИнициализацияКонтекста(ДанныеКонтекста) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ДанныеКонтекста);
	ВызватьПодключаемыйОбработчикСобытия("ИнициализацияКонтекста", "Инициализация", Параметры);
	
КонецПроцедуры

// Вызывается после инициализации контекстов и загрузки настроек.
// Позволяет выполнить настройку различных механизмов движка.
// 
// Важно: В этом обработчике нельзя менять параметр `ПараметрыЗапуска`.
// 
// Параметры:
//  ПараметрыЗапуска - см. ЮТФабрика.ПараметрыЗапуска
Процедура Инициализация(ПараметрыЗапуска) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ПараметрыЗапуска);
	ВызватьПодключаемыйОбработчикСобытия("Инициализация", "Инициализация", Параметры);
	
КонецПроцедуры

// Вызывается при сборе информации об окружении на клиенте.
// Позволяет дополнить описание окружения своими данными
// 
// Параметры:
//  ОписаниеОкружения - см. ЮТФабрика.НовоеОписаниеОкружения
Процедура СборИнформацииОбОкружении(ОписаниеОкружения) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ОписаниеОкружения);
	ВызватьПодключаемыйОбработчикСобытия("СборИнформацииОбОкружении", "Инициализация", Параметры);
	
КонецПроцедуры

#КонецОбласти

#Область СобытияИсполненияТестов

// Вызов события "ПередВсемиТестамиМодуля"
//
// Параметры:
//  ТестовыйМодуль - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
Процедура ПередВсемиТестамиМодуля(ТестовыйМодуль) Экспорт
	
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(ТестовыйМодуль);
	ВызватьОбработкуСобытияИсполненияТестов("ПередВсемиТестами", ОписаниеСобытия);
	
КонецПроцедуры

// Вызов события "ПередТестовымНабором"
//
// Параметры:
//  ТестовыйМодуль - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
//  Набор - см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоНабораТестов
Процедура ПередТестовымНабором(ТестовыйМодуль, Набор) Экспорт
	
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(ТестовыйМодуль, Набор);
	ВызватьОбработкуСобытияИсполненияТестов("ПередТестовымНабором", ОписаниеСобытия);
	
КонецПроцедуры

// Вызов события "ПередКаждымТестом"
//
// Параметры:
//  ТестовыйМодуль - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
//  Набор - см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоНабораТестов
//  Тест - см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоТеста
Процедура ПередКаждымТестом(ТестовыйМодуль, Набор, Тест) Экспорт
	
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(ТестовыйМодуль, Набор, Тест);
	ВызватьОбработкуСобытияИсполненияТестов("ПередКаждымТестом", ОписаниеСобытия, "ПередКаждымТестом, ПередТестом");
	
КонецПроцедуры

// Вызов события "ПослеКаждогоТеста"
//
// Параметры:
//  ТестовыйМодуль - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
//  Набор - см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоНабораТестов
//  Тест - см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоТеста
Процедура ПослеКаждогоТеста(ТестовыйМодуль, Набор, Тест) Экспорт
	
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(ТестовыйМодуль, Набор, Тест);
	ВызватьОбработкуСобытияИсполненияТестов("ПослеКаждогоТеста", ОписаниеСобытия, "ПослеКаждогоТеста, ПослеТеста");
	
КонецПроцедуры

// Вызов события "ПослеТестовогоНабора"
//
// Параметры:
//  ТестовыйМодуль - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
//  Набор - см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоНабораТестов
Процедура ПослеТестовогоНабора(ТестовыйМодуль, Набор) Экспорт
	
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(ТестовыйМодуль, Набор);
	ВызватьОбработкуСобытияИсполненияТестов("ПослеТестовогоНабора", ОписаниеСобытия);
	
КонецПроцедуры

// Вызов события "ПослеВсехТестовМодуля"
//
// Параметры:
//  ТестовыйМодуль - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
Процедура ПослеВсехТестовМодуля(ТестовыйМодуль) Экспорт
	
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(ТестовыйМодуль);
	ВызватьОбработкуСобытияИсполненияТестов("ПослеВсехТестов", ОписаниеСобытия);
	
КонецПроцедуры

// Перед выполнением тестов.
//
// Параметры:
//  ИсполняемыеМодули - Массив из см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоТестовогоМодуля
//  Отказ - Булево - Отказ от загрузки тестов из модуля
Процедура ПередВыполнениемТестов(ИсполняемыеМодули, Отказ) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ИсполняемыеМодули, Отказ);
	ВызватьПодключаемыйОбработчикСобытия("ПередВыполнениемТестов", "ИсполнениеТестов", Параметры);
	
	Если Параметры[1] Тогда
		Отказ = Истина;
		ЮТЛогирование.Предостережение("Выполнение тестовых сценариев отменено");
	КонецЕсли;
	
КонецПроцедуры

// После выполнения тестов.
//
// Параметры:
//  РезультатТестирования - Массив из см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоТестовогоМодуля
Процедура ПослеВыполненияТестов(РезультатТестирования) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(РезультатТестирования);
	ВызватьПодключаемыйОбработчикСобытия("ПослеВыполненияТестов", "ИсполнениеТестов", Параметры);
	
КонецПроцедуры

#КонецОбласти

#Область СобытияЗагрузкиТестов

// Вызов события "ПередЧтениеСценариев"
// Вызывается перед загрузкой тестов.
//  
// Параметры:
//  Отказ - Булево - Отказ от загрузки тестов из модуля
Процедура ПередЧтениеСценариев(Отказ) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(Отказ);
	ВызватьПодключаемыйОбработчикСобытия("ПередЧтениеСценариев", "ЗагрузкаТестов", Параметры);
	
	Если Параметры[0] Тогда
		Отказ = Истина;
		ЮТЛогирование.Предостережение("Загрузка тестовых сценариев отменена");
	КонецЕсли;
	
КонецПроцедуры

// Вызов события "ПередЧтениемСценариевМодуля"
//  Вызывается перед чтением сценариев конкретного модуля (вызовом метода `ИсполняемыеСценарии`).
//  Позволяет настроить базовые параметры перед чтением настроек тестов модуля.
//  
// Параметры:
//  МетаданныеМодуля - см. ЮТФабрикаСлужебный.ОписаниеМетаданныеМодуля
Процедура ПередЧтениемСценариевМодуля(МетаданныеМодуля) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(МетаданныеМодуля);
	ВызватьПодключаемыйОбработчикСобытия("ПередЧтениемСценариевМодуля", "ЗагрузкаТестов", Параметры);
	
КонецПроцедуры

// После чтения сценариев модуля.
//  Позволяет настроить/обработать параметры загруженных настроек тестов модуля
// Параметры:
//  ОписаниеТестовогоМодуля - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
Процедура ПослеЧтенияСценариевМодуля(ОписаниеТестовогоМодуля) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ОписаниеТестовогоМодуля);
	ВызватьПодключаемыйОбработчикСобытия("ПослеЧтенияСценариевМодуля", "ЗагрузкаТестов", Параметры);
	
КонецПроцедуры

// Вызов события "ПослеЧтенияСценариев"
// Параметры:
//  Сценарии - Массив из см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля - Набор описаний тестовых модулей, которые содержат информацию о запускаемых тестах
Процедура ПослеЧтенияСценариев(Сценарии) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(Сценарии);
	ВызватьПодключаемыйОбработчикСобытия("ПослеЧтенияСценариев", "ЗагрузкаТестов", Параметры);
	
КонецПроцедуры

// Вызов события "ПослеФормированияИсполняемыхНаборовТестов"
// Параметры:
//  ИсполняемыеТестовыеМодули - Массив из см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоТестовогоМодуля - Набор исполняемых наборов
Процедура ПослеФормированияИсполняемыхНаборовТестов(ИсполняемыеТестовыеМодули) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ИсполняемыеТестовыеМодули);
	ВызватьПодключаемыйОбработчикСобытия("ПослеФормированияИсполняемыхНаборовТестов", "ЗагрузкаТестов", Параметры);
	
КонецПроцедуры

// Вызов события "ФильтрацияТестов_ПроверкаМодуля"
//  Вызывается при поиске тестовых модулей.
//  Позволяет отфильтровать "лишние" тестовые модули
//  
// Параметры:
//  МетаданныеМодуля - см. ЮТФабрикаСлужебный.ОписаниеМетаданныеМодуля
//  Отказ - Булево - Отказ от загрузки тестов из модуля
Процедура ФильтрацияТестов_ПроверкаМодуля(МетаданныеМодуля, Отказ) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(МетаданныеМодуля, Отказ);
	ВызватьПодключаемыйОбработчикСобытия("ФильтрацияТестов_ПроверкаМодуля", "ЗагрузкаТестов", Параметры);
	
	Если Параметры[1] Тогда
		Отказ = Истина;
		ЮТЛогирование.Отладка(СтрШаблон("Загрузка модуля `%1`отклонена при обработке события", МетаданныеМодуля.Имя));
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ВызватьОбработкуСобытияИсполненияТестов(ИмяСобытия, ОписаниеСобытия, ОбработчикиТестовогоМодуля = Неопределено)
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ОписаниеСобытия);
	
	Если ЭтоСобытиеПеред(ИмяСобытия) Тогда
		
		Ошибки = ВызватьПодключаемыйОбработчикСобытия(ИмяСобытия, "ИсполнениеТестов", Параметры);
#Если Клиент Тогда
		СерверныеОшибки = ВызватьСервернуюОбработкуСобытияИсполненияТестов(ИмяСобытия, ОписаниеСобытия);
		ЮТКоллекции.ДополнитьМассив(Ошибки, СерверныеОшибки);
#КонецЕсли
		ВызватьОбработчикиТестовогоМодуля(ИмяСобытия, ОписаниеСобытия, ОбработчикиТестовогоМодуля);
		
	Иначе
		
		ВызватьОбработчикиТестовогоМодуля(ИмяСобытия, ОписаниеСобытия, ОбработчикиТестовогоМодуля);
		Ошибки = ВызватьПодключаемыйОбработчикСобытия(ИмяСобытия, "ИсполнениеТестов", Параметры);
#Если Клиент Тогда
		СерверныеОшибки = ВызватьСервернуюОбработкуСобытияИсполненияТестов(ИмяСобытия, ОписаниеСобытия);
		ЮТКоллекции.ДополнитьМассив(Ошибки, СерверныеОшибки);
#КонецЕсли
		
	КонецЕсли;
	
	ЗарегистрироватьОшибкиСобытияИсполнения(ИмяСобытия, ОписаниеСобытия, Ошибки);
	
КонецПроцедуры

Функция ВызватьСервернуюОбработкуСобытияИсполненияТестов(ИмяСобытия, ОписаниеСобытия)
	
	Параметры = Новый Массив(4);
	Параметры[0] = ИмяСобытия;
	
	Если ОписаниеСобытия.Модуль <> Неопределено Тогда
		Параметры[1] = ЮТИсполнительСлужебныйКлиентСервер.ИдентификаторТестовогоМодуля(ОписаниеСобытия.Модуль);
	КонецЕсли;
	
	Если ОписаниеСобытия.Набор <> Неопределено Тогда
		Параметры[2] = ЮТИсполнительСлужебныйКлиентСервер.ИдентификаторТестовогоНабора(ОписаниеСобытия.Модуль, ОписаниеСобытия.Набор);
	КонецЕсли;
	
	Если ОписаниеСобытия.Тест <> Неопределено Тогда
		Параметры[3] = ЮТИсполнительСлужебныйКлиентСервер.ИдентификаторТеста(ОписаниеСобытия.Модуль, ОписаниеСобытия.Набор, ОписаниеСобытия.Тест);
	КонецЕсли;
	
	Возврат ЮТМетодыСлужебный.ВызватьФункциюКонфигурацииНаСервере("ЮТСобытияСлужебный", "СерверныйВызовОбработкиСобытияИсполненияТестов", Параметры);
	
КонецФункции

#Если Сервер Тогда
Функция СерверныйВызовОбработкиСобытияИсполненияТестов(ИмяСобытия,
													   ИдентификаторМодуля = Неопределено,
													   ИдентификаторНабора = Неопределено,
													   ИдентификаторТеста = Неопределено) Экспорт
	
	Хранилище = ЮТИсполнительСлужебныйСервер.СерверноеХранилищеТестов();
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(Неопределено);
	
	Если ИдентификаторМодуля <> Неопределено Тогда
		ОписаниеСобытия.Модуль = Хранилище[ИдентификаторМодуля];
	КонецЕсли;
	
	Если ИдентификаторНабора <> Неопределено Тогда
		ОписаниеСобытия.Набор = Хранилище[ИдентификаторНабора];
	КонецЕсли;
	
	Если ИдентификаторТеста <> Неопределено Тогда
		ОписаниеСобытия.Тест = Хранилище[ИдентификаторТеста];
	КонецЕсли;
	
	Результат = ВызватьПодключаемыйОбработчикСобытия(ИмяСобытия, "ИсполнениеТестов", ЮТКоллекции.ЗначениеВМассиве(ОписаниеСобытия));
	
	Возврат Результат;
	
КонецФункции
#КонецЕсли

Функция ВызватьПодключаемыйОбработчикСобытия(ИмяСобытия, Подсистема, ПараметрыСобытия) Экспорт
	
	ОбработчикиСобытий = ЮТПодключаемыеМодулиСлужебный.ОбработчикиСобытий(Подсистема);
	
	Если ЭтоСобытиеПосле(ИмяСобытия) Тогда
		ОбработчикиСобытий = ЮТКоллекции.ОбратныйПорядок(ОбработчикиСобытий);
	КонецЕсли;
	
	Ошибки = Новый Массив();
	
	Для Каждого ИмяМодуля Из ОбработчикиСобытий Цикл
		
		Если ЮТМетодыСлужебный.МетодМодуляСуществует(ИмяМодуля, ИмяСобытия) Тогда
			
			ЮТЛогирование.Отладка(СтрШаблон("Обработка события `%1` - `%2.%3`", ИмяСобытия, ИмяМодуля, ИмяСобытия));
			Ошибка = ЮТМетодыСлужебный.ВыполнитьМетодКонфигурацииСПерехватомОшибки(ИмяМодуля, ИмяСобытия, ПараметрыСобытия);
			Если Ошибка <> Неопределено Тогда
				ЮТЛогирование.Ошибка(ЮТРегистрацияОшибок.ПредставлениеОшибки("Ошибка обработки события", Ошибка));
			КонецЕсли;
			
			Если Ошибка <> Неопределено Тогда
				Ошибки.Добавить(Ошибка);
			КонецЕсли;
			
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Ошибки;
	
КонецФункции

Процедура ВызватьОбработчикиТестовогоМодуля(ИмяСобытия, ОписаниеСобытия, ОбработчикиСобытия)
	
	ОбработчикСобытия = ПереопределенноеИмяСобытия(ИмяСобытия);
	
	Если ЗначениеЗаполнено(ОбработчикСобытия) Тогда
		ВызватьОбработчикТестовогоМодуля(ИмяСобытия, ОписаниеСобытия, ОбработчикСобытия, Истина);
	ИначеЕсли НЕ ЗначениеЗаполнено(ОбработчикиСобытия) Тогда
		ВызватьОбработчикТестовогоМодуля(ИмяСобытия, ОписаниеСобытия, ИмяСобытия, Ложь);
	Иначе
		Для Каждого ОбработчикСобытия Из ЮТСтроки.РазделитьСтроку(ОбработчикиСобытия, ",") Цикл
			ВызватьОбработчикТестовогоМодуля(ИмяСобытия, ОписаниеСобытия, ОбработчикСобытия, Ложь);
		КонецЦикла;
	КонецЕсли;
	
КонецПроцедуры

Процедура ВызватьОбработчикТестовогоМодуля(ИмяСобытия, ОписаниеСобытия, ОбработчикСобытия, ОбработчикСобытияПереопределен)
	
	ИмяМодуля = ОписаниеСобытия.Модуль.Метаданные.Имя;
	
	ЧастиКоманды = СтрРазделить(ОбработчикСобытия, ".");
	Если ЧастиКоманды.Количество() = 2 Тогда
		ИмяМодуля = ЧастиКоманды[0];
		ИмяМетода = ЧастиКоманды[1];
	Иначе
		ИмяМетода = ОбработчикСобытия;
	КонецЕсли;
	
	Ошибки = Новый Массив();
	Если ЮТМетодыСлужебный.МетодМодуляСуществует(ИмяМодуля, ИмяМетода) Тогда
		
		ЮТЛогирование.Отладка(СтрШаблон("Обработка события `%1` - `%2.%3`", ИмяСобытия, ИмяМодуля, ИмяМетода));
		Ошибка = ЮТМетодыСлужебный.ВыполнитьМетодКонфигурацииСПерехватомОшибки(ИмяМодуля, ИмяМетода);
		
		Если Ошибка <> Неопределено Тогда
			ЮТЛогирование.Ошибка(ЮТРегистрацияОшибок.ПредставлениеОшибки("Ошибка обработки события", Ошибка));
			Ошибки.Добавить(Ошибка);
		КонецЕсли;
		
	ИначеЕсли ОбработчикСобытияПереопределен Тогда
		
		ТекстИсключения = СтрШаблон("Не найден обработчик тестового модуля %1.%2", ИмяМодуля, ИмяМетода);
		ВызватьИсключение ТекстИсключения;
		
	КонецЕсли;
	
	ЗарегистрироватьОшибкиСобытияИсполнения(ИмяСобытия, ОписаниеСобытия, Ошибки);
	
КонецПроцедуры

Процедура ЗарегистрироватьОшибкиСобытияИсполнения(ИмяСобытия, ОписаниеСобытия, Ошибки)
	
	Для Каждого Ошибка Из Ошибки Цикл
		ЮТРегистрацияОшибокСлужебный.ЗарегистрироватьОшибкуСобытияИсполнения(ИмяСобытия, ОписаниеСобытия, Ошибка);
	КонецЦикла;
	
КонецПроцедуры

Функция ПереопределенноеИмяСобытия(ИмяСобытия)
	
	Если ЭтоСобытиеПеред(ИмяСобытия) Тогда
		Возврат ЮТНастройкиВыполнения.Перед();
	ИначеЕсли ЭтоСобытиеПосле(ИмяСобытия) Тогда
		Возврат ЮТНастройкиВыполнения.После();
	Иначе
		Возврат "";
	КонецЕсли;
	
КонецФункции

Функция ЭтоСобытиеПеред(ИмяСобытия)
	
	Возврат СтрНачинаетсяС(ИмяСобытия, "Перед");
	
КонецФункции

Функция ЭтоСобытиеПосле(ИмяСобытия)
	
	Возврат СтрНачинаетсяС(ИмяСобытия, "После");
	
КонецФункции

#КонецОбласти
