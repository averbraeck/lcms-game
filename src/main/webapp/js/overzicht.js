document.addEventListener('DOMContentLoaded', () => {

    const selectAll = document.getElementById('selectAll');

    if (selectAll) {
        selectAll.addEventListener('change', () => {
            document
                .querySelectorAll("input[name='selectedIds']")
                .forEach(cb => cb.checked = selectAll.checked);
        });
    }

    document
        .querySelectorAll('.messageTable tbody tr')
        .forEach(row => {

            row.addEventListener('click', (event) => {

                if (event.target.closest('input[type="checkbox"]')) {
                    return;
                }

                const id = row.dataset.id;

                if (id) {
                    window.location =
                        'messageDetail?id=' + encodeURIComponent(id);
                }
            });
        });
});

function sortBy(column) {

    const sortField = document.getElementById('sortField');
    const sortDirection = document.getElementById('sortDirection');
    const sortForm = document.getElementById('sortForm');

    if (!sortField || !sortDirection || !sortForm) {
        return;
    }

    let newDirection = 'asc';

    if (sortField.value === column) {
        newDirection =
            sortDirection.value === 'asc'
                ? 'desc'
                : 'asc';
    }

    sortField.value = column;
    sortDirection.value = newDirection;

    sortForm.submit();
}