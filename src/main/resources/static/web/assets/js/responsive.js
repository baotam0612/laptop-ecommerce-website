(function () {
    var desktop = window.matchMedia('(min-width: 992px)');
    
    // Toggle Mobile Navigation
    document.querySelectorAll('.navigation-toggle').forEach(function (button) {
        var navigation = document.getElementById(button.getAttribute('aria-controls'));
        if (!navigation) return;

        function close() {
            button.setAttribute('aria-expanded', 'false');
            navigation.classList.remove('is-open');
        }

        button.addEventListener('click', function () {
            var open = button.getAttribute('aria-expanded') !== 'true';
            button.setAttribute('aria-expanded', String(open));
            navigation.classList.toggle('is-open', open);
        });

        navigation.addEventListener('click', function (event) {
            if (event.target.closest('a')) close();
        });

        document.addEventListener('keydown', function (event) {
            if (event.key === 'Escape' && button.getAttribute('aria-expanded') === 'true') {
                close();
                button.focus();
            }
        });

        desktop.addEventListener('change', close);
    });

    // Active state highlighting for Storefront
    var currentPath = window.location.pathname;
    document.querySelectorAll('#store-navigation a').forEach(function (link) {
        var href = link.getAttribute('href');
        if (href && (currentPath === href || (href !== '/' && href !== '/trang-chu' && currentPath.startsWith(href)))) {
            link.classList.add('active');
        }
    });

    // Active state highlighting for Admin Navigation
    document.querySelectorAll('#admin-navigation a').forEach(function (link) {
        var href = link.getAttribute('href');
        var active = currentPath === href ||
            (href === '/admin/product-list' && currentPath.indexOf('/admin/product-edit') === 0) ||
            (href === '/admin/users' && currentPath.indexOf('/admin/users/') === 0);
        link.classList.toggle('active', active);
        if (active) link.setAttribute('aria-current', 'page');
    });
}());
