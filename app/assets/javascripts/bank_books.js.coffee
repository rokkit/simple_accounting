$ ->
  (($) ->
    $.fn.datetimepicker.dates["ru"] =
      days: ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"]
      daysShort: ["Вск", "Пнд", "Втр", "Срд", "Чтв", "Птн", "Суб", "Вск"]
      daysMin: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
      months: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
      monthsShort: ["Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек"]
      today: "Сегодня"
  ) jQuery
  $("#datetimepicker1").datetimepicker language: "ru"


$ ->
  $(".datatable").dataTable
    sDom: "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"
    sPaginationType: "bootstrap"
    aoColumnDefs:[{bSortable: false, aTargets:[0,2,3,5,6,7,8,9,10]}]
    oLanguage:
            sProcessing: "Подождите..."
            sLengthMenu: "Показать _MENU_ записей"
            sZeroRecords: "Записи отсутствуют."
            sInfo: "Записи с _START_ до _END_ из _TOTAL_ записей"
            sInfoEmpty: "Записи с 0 до 0 из 0 записей"
            sInfoFiltered: "(отфильтровано из _MAX_ записей)"
            sInfoPostFix: ""
            sSearch: "Поиск:"
            sUrl: ""
            oPaginate:
              sFirst: "Первая"
              sPrevious: "Предыдущая"
              sNext: "Следующая"
              sLast: "Последняя"
            oAria:
              sSortAscending: ": активировать для сортировки столбца по возрастанию"
              sSortDescending: ": активировать для сортировки столбцов по убыванию"
