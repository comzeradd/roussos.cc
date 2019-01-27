$(document).ready(function() {
    'use strict';

    // handle copy events
    $('#copy').click(function() {
        const target = $(this).data('target');
        const copyText = document.getElementById(target);
        copyText.select();
        document.execCommand('copy');
        $('#copied-' + target).addClass('highlight');
    });

    // tooltips
    $('[data-toggle="tooltip"]').tooltip();
});
