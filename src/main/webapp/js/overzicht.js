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

async function updateTime() {
    try {
        document.getElementById('currentTime').style.color = '#666'; // Loading state
        const response = await fetch('/lcms/api/gametime', { cache: 'no-cache' });
        const data = await response.json();
        document.getElementById('currentTime').textContent = data.time;
        document.getElementById('currentTime').style.color = 'black';
    } catch (error) {
      document.getElementById('currentTime').textContent = 'Tijd onbekend';
      document.getElementById('currentTime').style.color = 'red';
    }
}

document.addEventListener('DOMContentLoaded', function() {
    // Verify the target element exists
    if (!document.getElementById('currentTime')) {
        console.warn('Time display element not found.');
        return;
    }
    
    updateTime();
    setInterval(updateTime, 10000);
});
