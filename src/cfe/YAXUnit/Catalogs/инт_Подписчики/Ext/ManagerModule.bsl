﻿&Вместо("СформироватьСообщениеПоПодписчику")
Функция Мок_СформироватьСообщениеПоПодписчику(ДанныеСообщения, Подписчик)
  ПараметрыМетода = Мокито.МассивПараметров(ДанныеСообщения, Подписчик);
  ПрерватьВыполнение = Ложь;

  Результат = МокитоПерехват.АнализВызова(Справочники.инт_Подписчики, "СформироватьСообщениеПоПодписчику", ПараметрыМетода, ПрерватьВыполнение);

  Если Не ПрерватьВыполнение Тогда
    Возврат ПродолжитьВызов(ДанныеСообщения, Подписчик);
  Иначе
    Возврат Результат;
  КонецЕсли;
КонецФункции

&Вместо("ОтправитьСообщениеПодписчику")
Процедура Мок_ОтправитьСообщениеПодписчику(Сообщение)
  ПараметрыМетода = Мокито.МассивПараметров(Сообщение);
  ПрерватьВыполнение = Ложь;

  МокитоПерехват.АнализВызова(Справочники.инт_Подписчики, "ОтправитьСообщениеПодписчику", ПараметрыМетода, ПрерватьВыполнение);

  Если Не ПрерватьВыполнение Тогда
    ПродолжитьВызов(Сообщение);
  КонецЕсли;
КонецПроцедуры
