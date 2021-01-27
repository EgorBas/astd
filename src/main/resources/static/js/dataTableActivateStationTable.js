$(document).ready(function () {
    var table = $('#stationTable').DataTable({
        lengthChange: false,
        colReorder: true,
        order: [[0, 'asc']],
        "pageLength": 10,
        "pagingType": "full_numbers",
        lengthMenu: [
            [5, 10, 15, 25, 50, -1],
            ['5 строк', '10 строк', '15 строк', '25 строк', '50 строк', 'Все']],
        buttons: [
            {
                extend: 'pageLength',
                text: 'Кол-во строк',
            },
            {
                extend: 'colvis',
                text: 'Видимость столбцов',
                postfixButtons: [
                    {
                        extend: 'colvisRestore',
                        text: 'Сброс',
                        className: 'text-center'
                    }
                ]
            },
            {
                extend: 'collection',
                text: 'Экспорт',
                autoClose: true,
                buttons: [
                    {
                        extend: 'copy',
                        text: 'Копировать в Буфер',
                        className: 'text-center'
                    },
                    {
                        extend: 'csv',
                        text: 'Экспорт в CSV',
                        className: 'text-center'
                    },
                    {
                        extend: 'excel',
                        text: 'Экспорт в Excel',
                        className: 'text-center'
                    },
                ]
            },
            {
                extend: 'print',
                text: 'Печать'
            },
        ],
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            },
            "select": {
                "rows": {
                    "_": "Выбрано записей: %d",
                    "0": "Кликните по записи для выбора",
                    "1": "Выбрана одна запись"
                }
            }
        }
    });
    table.buttons().container()
        .appendTo('#stationTable_wrapper .col-md-6:eq(0)');
});