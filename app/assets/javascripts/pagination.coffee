$ ->
  if $('.navigation').length && $('#posts').length
    $(window).scroll ->
      url = $('.navigation .pagination .next a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.navigation').text('Загрузка статей...')
        $.getScript(url)

    $(window).scroll()