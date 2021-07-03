module ApplicationHelper
  INDIAN_COMMA_REGEX = /(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/

  def comma_style(num, rounding: 1, precision: 2, currency_symbol: nil, style: 'indian', strip_insignificant_zeros: false)
    return '-&nbsp;&nbsp;&nbsp;'.html_safe if num.zero?
    rounded_num = (num.to_f / rounding)
    amt         = if style == 'indian'
                    number_with_precision(rounded_num.abs, precision: precision, delimiter: ',', strip_insignificant_zeros: strip_insignificant_zeros, delimiter_pattern: INDIAN_COMMA_REGEX)
                  else
                    number_with_precision(rounded_num.abs, precision: precision, delimiter: ',')
                  end
    if rounded_num.negative?
      content_tag(:span, "(#{"#{currency_symbol} " if currency_symbol}#{amt})".html_safe, style: 'color: #ed0000', class: 'negative-num').html_safe
    else
      content_tag(:span, "#{"#{currency_symbol} " if currency_symbol}#{amt}".html_safe, class: 'positive-num')
    end
  end
end
